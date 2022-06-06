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
    public class CategoryTopicConfiguration : IEntityTypeConfiguration<CategoryTopic>
    {
        public void Configure(EntityTypeBuilder<CategoryTopic> builder)
        {
            builder.HasKey(x => new { x.CategoryId, x.TopicId });
        }
    }
}
