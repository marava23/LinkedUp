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
    public class ExceptionLogConfiguration : IEntityTypeConfiguration<ExceptionLog>
    {
        public void Configure(EntityTypeBuilder<ExceptionLog> builder)
        {
            builder.Property(x => x.ExceptionType).IsRequired(false).HasMaxLength(50);
        }
    }
}
