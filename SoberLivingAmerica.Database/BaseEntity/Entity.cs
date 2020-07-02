using SoberLivingAmerica.Database.BaseEntity;
using System;
using System.Collections.Generic;
using System.Text;

namespace SoberLivingAmerica.Database.Tables
{
    public class BaseEntity
    {

    }

    public class Entity<T> : BaseEntity, IEntity<T>
    {
        public T Id { get; set; }
    }
}
