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
    public class UserInterestConfiguration : IEntityTypeConfiguration<UserInterest>
    {
        public void Configure(EntityTypeBuilder<UserInterest> builder)
        {
            builder.HasKey(x => new { x.TopicId, x.UserId });
            builder.HasOne(x => x.User).WithMany(x => x.Interests).HasForeignKey(x => x.TopicId).OnDelete(DeleteBehavior.Restrict);
        }
    }
}
