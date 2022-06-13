using Doublel.DynamicQueryBuilder;
using Doublel.DynamicQueryBuilder.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.Application.Searches
{
    public class UserSearch : PageSearch
    {
        [QueryProperties(ComparisonOperator.Contains, "FirstName", "LastName", "Username", "Email")]
        public string Keyword { get; set; }
    }
}
