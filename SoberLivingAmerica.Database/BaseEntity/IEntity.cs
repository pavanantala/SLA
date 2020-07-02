using System;
using System.Collections.Generic;
using System.Text;

namespace SoberLivingAmerica.Database.BaseEntity
{
    public interface IEntity<T>
    {
        T Id { get; set; }
    }
}
