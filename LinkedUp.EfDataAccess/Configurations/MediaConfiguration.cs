using LinkedUp.Domain;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.EfDataAccess.Configurations
{
    public class MediaConfiguration : EntityConfiguration<Media>
    {
        protected override void ConfigureRules(EntityTypeBuilder<Media> builder)
        {
            builder.Property(x => x.Path).IsRequired().HasMaxLength(100);
            builder.HasIndex(x => x.Path).IsUnique();
            builder.Property(x => x.Size).IsRequired();
            builder.HasOne(x => x.User).WithOne(x => x.Media).HasForeignKey<User>(x => x.MediaId);
        }
    }
}
