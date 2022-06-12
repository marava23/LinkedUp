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
    public class UseCaseLogConfiguration : IEntityTypeConfiguration<UseCaseLog>
    {
        public void Configure(EntityTypeBuilder<UseCaseLog> builder)
        {
            builder.Property(x => x.UseCaseName).IsRequired().HasMaxLength(50);
            builder.Property(x => x.User).IsRequired().HasMaxLength(50);
            builder.HasIndex(x => x.User);
            builder.Property(x => x.Duration).IsRequired();
        }
    }
}
