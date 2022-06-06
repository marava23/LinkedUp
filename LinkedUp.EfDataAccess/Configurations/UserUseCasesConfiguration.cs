using LinkedUp.Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.EfDataAccess.Configurations
{
    public class UserUseCasesConfiguration : IEntityTypeConfiguration<UserUseCase>
    {
        public void Configure(EntityTypeBuilder<UserUseCase> builder)
        {
            builder.HasKey(x => new { x.UseCaseId, x.UserId });
            builder.HasOne(x => x.User).WithMany(x => x.UseCases).HasForeignKey(x => x.UserId);
        }
    }
}
