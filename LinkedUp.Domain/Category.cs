using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Domain
{
    public class Category : Entity
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public int? ParentId { get; set; }
        public virtual ICollection<Category> ChildCategories { get; set; } = new List<Category>();
        public virtual Category ParentCategory { get; set; }
        public virtual ICollection<CategoryTopic> CategoryTopic { get; set; } = new List<CategoryTopic>();
    }
}
