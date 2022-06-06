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
    public class PostMediaConfiguration : IEntityTypeConfiguration<PostMedia>
    {
        public void Configure(EntityTypeBuilder<PostMedia> builder)
        {
            builder.HasKey(x => new { x.MediaId, x.PostId });
            builder.HasOne(x => x.Post).WithMany(x => x.PostMedia).HasForeignKey(x => x.PostId);
            builder.HasOne(x => x.Media).WithMany(x => x.PostMedia).HasForeignKey(x => x.MediaId);
        }
    }
}
