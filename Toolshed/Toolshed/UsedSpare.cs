//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Toolshed
{
    using System;
    using System.Collections.Generic;
    
    public partial class UsedSpare
    {
        public int idUsedSpare { get; set; }
        public int idServiceFile { get; set; }
        public int idSparePart { get; set; }
        public int Quantity { get; set; }
    
        public virtual ServiceFile ServiceFile { get; set; }
        public virtual SparePart SparePart { get; set; }
    }
}
