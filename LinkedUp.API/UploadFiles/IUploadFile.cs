using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LinkedUp.API.UploadFiles
{
    public interface IUploadFile
    {
        string Upload(IFormFile file);
    }
}
