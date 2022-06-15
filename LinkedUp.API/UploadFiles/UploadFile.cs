using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace LinkedUp.API.UploadFiles
{
    public class UploadFile : IUploadFile
    {
        public string Upload(IFormFile file)
        {
            
            var extension = Path.GetExtension(file.FileName);

            var newFileName = Guid.NewGuid() + extension;

            var path = Path.Combine("wwwroot", "images", newFileName);

            using (var fileStream = new FileStream(path, FileMode.Create))
            {
                file.CopyTo(fileStream);
            }

            return newFileName;
        }
    }
}
