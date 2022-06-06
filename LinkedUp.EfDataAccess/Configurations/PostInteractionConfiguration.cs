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
    public class PostInteractionConfiguration : IEntityTypeConfiguration<PostIntercation>
    {
        public void Configure(EntityTypeBuilder<PostIntercation> builder)
        {
            builder.HasMany(x => x.ChildrenInteractions).WithOne(x => x.ParentIntercation).HasForeignKey(x => x.PostIntercationId);
            builder.Property(x => x.Content).IsRequired(false);
        }
    }
}
