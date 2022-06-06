using LinkedUp.Domain;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.EfDataAccess.Configurations
{
    public class PostConfiguration : EntityConfiguration<Post>
    {
        protected override void ConfigureRules(EntityTypeBuilder<Post> builder)
        {
            builder.Property(x => x.Content).IsRequired();
            builder.HasMany(x => x.Intercations).WithOne(x => x.Post).HasForeignKey(x => x.PostId);
        }
    }
}
