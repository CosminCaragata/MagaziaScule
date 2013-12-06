using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Toolshed
{
    public class RepositoryResponse<T>
    {
        public ResultStatus Status;
        public string Message;
        public T Result;

        public RepositoryResponse(ResultStatus status, string message, T result)
        {
            this.Status = status;
            this.Message = message;
            this.Result = result;

        }
    }

    public enum ResultStatus
    { 
        OK  = 1,
        NotOk = 2
    }
}
