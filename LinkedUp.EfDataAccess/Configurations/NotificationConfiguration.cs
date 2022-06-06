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
    public class NotificationConfiguration : EntityConfiguration<Notification>
    {

        protected override void ConfigureRules(EntityTypeBuilder<Notification> builder)
        {
            builder.Property(x => x.Read).HasDefaultValue(0);
            builder.HasOne(x => x.User).WithMany(x => x.Notifications).HasForeignKey(x => x.UserId).OnDelete(DeleteBehavior.Restrict);
            builder.HasOne(x => x.ActionByUser).WithMany(x => x.Actions).HasForeignKey(x => x.ActionByUserId).OnDelete(DeleteBehavior.Restrict);
            builder.Property(x => x.Action).HasMaxLength(100).IsRequired();
        }
    }
}
