using LinkedUp.Application.Exceptions;
using LinkedUp.Application.UseCases;
using LinkedUp.Domain;
using LinkedUp.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Implementation.UseCases.Commands
{
    public abstract class EfGenericDeleteOwn<TEntity> : ICommand<int>
        where TEntity : Entity
    {
        public abstract int Id { get; }

        public abstract string Name { get; }

        public abstract string Description { get; }
        private LinkedUpContext _context;
        private IApplicationUser _user;

        protected EfGenericDeleteOwn(LinkedUpContext context, IApplicationUser user)
        {
            _context = context;
            _user = user;
        }

        public void Execute(int request)
        {

            var item = _context.Set<TEntity>().Find(request);
            if (item is null)
            {
                throw new EntityNotFoundException(request, typeof(TEntity));
            }
            if (_user.Id != request || !_user.IsAdmin)
            {
                throw new ForbiddenUseCaseExecutionException(Name, _user.Identity);
            }
            if (_user.IsAdmin)
            {
                item.DeletedAt = DateTime.UtcNow;
                item.DeletedBy = _user.Identity;
            }
            item.IsActive = false;
            _context.SaveChanges();
        }
    }
}
