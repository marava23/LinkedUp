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
    public class ConnectionConfiguration : EntityConfiguration<Connection>
    {
        protected override void ConfigureRules(EntityTypeBuilder<Connection> builder)
        {
            builder.Property(x => x.Status).HasDefaultValue(0);
            builder.HasOne(x => x.Sender).WithMany(x => x.Sended).HasForeignKey(x => x.SenderId).OnDelete(DeleteBehavior.Restrict);
            builder.HasOne(x => x.Reciever).WithMany(x => x.Recieved).HasForeignKey(x => x.RecieverId).OnDelete(DeleteBehavior.Restrict);
        }
    }
}
