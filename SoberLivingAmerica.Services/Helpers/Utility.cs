using AutoMapper;
using SimpleCrypto;
using System;
using System.Reflection;

namespace SoberLivingAmerica.Services.Helpers
{
    public static class Utility
    {
        public static IMappingExpression<TSource, TDestination> IgnoreAllNonExisting<TSource, TDestination>
            (this IMappingExpression<TSource, TDestination> expression)
        {
            var flags = BindingFlags.Public | BindingFlags.Instance;
            var sourceType = typeof(TSource);
            var destinationProperties = typeof(TDestination).GetProperties(flags);

            foreach (var property in destinationProperties)
            {
                if (sourceType.GetProperty(property.Name, flags) == null)
                {
                    expression.ForMember(property.Name, opt => opt.Ignore());
                }
            }
            return expression;
        }

        public static string GetRandomPassword(int length)
        {
            var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var stringChars = new char[length];
            var random = new Random();

            for (int i = 0; i < stringChars.Length; i++)
            {
                stringChars[i] = chars[random.Next(chars.Length)];
            }

            var finalString = new string(stringChars);
            return finalString;
        }

        public static string PasswordEncryption(this string text)
        {
            if (string.IsNullOrEmpty(text))
                return text;

            string salt =  "134580.9oiBwMFtgGHyuIu2UY76Ad39ZWL/1dfdsCltvwaM0ZElNjA==";
            ICryptoService _PBKDF2 = new PBKDF2();
            return _PBKDF2.Compute(text, salt);
        }
    }
}
