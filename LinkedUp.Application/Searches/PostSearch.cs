using Doublel.DynamicQueryBuilder;
using Doublel.DynamicQueryBuilder.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Application.Searches
{
    public class PostSearch : PageSearch
    {
        [QueryProperties(ComparisonOperator.Contains, "Author")]
        public string Keyword { get; set; }
    }
}
