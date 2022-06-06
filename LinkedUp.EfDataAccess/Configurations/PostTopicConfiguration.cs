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
    public class PostTopicConfiguration : IEntityTypeConfiguration<PostTopic>
    {
        public void Configure(EntityTypeBuilder<PostTopic> builder)
        {
            builder.HasKey(x => new { x.PostId, x.TopicId });
            builder.HasOne(x => x.Post).WithMany(x => x.Topics).HasForeignKey(x => x.PostId).OnDelete(DeleteBehavior.Restrict);
            builder.HasOne(x => x.Topic).WithMany(x => x.Posts).HasForeignKey(x => x.TopicId).OnDelete(DeleteBehavior.Restrict);
        }
    }
}
