using LinkedUp.Application.Exceptions;
using LinkedUp.Application.Logging;
using LinkedUp.Application.UseCases;
using LinkedUp.Domain;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Implementation
{
    public class UseCaseHandler
    {
        private IExceptionLogger _logger;
        private IApplicationUser _user;
        private IUseCaseLogger _useCaseLogger;

        public UseCaseHandler(
            IExceptionLogger logger,
            IApplicationUser user,
            IUseCaseLogger useCaseLogger)
        {
            _logger = logger;
            _user = user;
            _useCaseLogger = useCaseLogger;
        }

        public void HandleCommand<TRequest>(ICommand<TRequest> command, TRequest data)
        {
            try
            {
                if (!_user.UseCaseIds.Contains(command.Id))
                {
                    throw new ForbiddenUseCaseExecutionException(command.Name, _user.Identity);
                }
                var stopwatch = new Stopwatch();
                stopwatch.Start();

                command.Execute(data);

                stopwatch.Stop();

                HandleLogging(command, data, (int)stopwatch.ElapsedMilliseconds);
            }
            catch (Exception ex)
            {
                _logger.Log(ex);
                throw;
            }
        }

        public TResponse HandleQuery<TRequest, TResponse>(IQuery<TResponse, TRequest> query, TRequest data)
        {
            try
            {
                if (!_user.UseCaseIds.Contains(query.Id))
                {
                    throw new ForbiddenUseCaseExecutionException(query.Name, _user.Identity);
                }
                var stopwatch = new Stopwatch();
                stopwatch.Start();

                var response = query.Execute(data);

                stopwatch.Stop();

                HandleLogging(query, data, (int)stopwatch.ElapsedMilliseconds);

                return response;
            }
            catch (Exception ex)
            {
                _logger.Log(ex);
                throw;
            }
        }

        private void HandleLogging<TRequest>(IUseCase useCase, TRequest data, int? duration)
        {

            var log = new UseCaseLog
            {
                User = _user.Identity,
                ExecutionDateTime = DateTime.UtcNow,
                UseCaseName = useCase.Name,
                UserId = _user.Id,
                Data = JsonConvert.SerializeObject(data),
                Duration = duration.Value
            };

            _useCaseLogger.Log(log);

        }
    }
}
