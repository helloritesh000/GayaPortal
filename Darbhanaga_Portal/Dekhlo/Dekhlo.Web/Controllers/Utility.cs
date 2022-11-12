using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Dekhlo.Web.Models;
using System.Net;

namespace Dekhlo.Web.Controllers
{
    [HandleErrorCustom(View = "Error")]
    public static class Utility
    {
        static PORTALEntitiy db = new PORTALEntitiy();

        public static IEnumerable<T> Shuffle<T>(this IEnumerable<T> source, Random rng)
        {
            T[] elements = source.ToArray();
            // Note i > 0 to avoid final pointless iteration
            for (int i = elements.Length - 1; i > 0; i--)
            {
                // Swap element "i" with a random earlier element it (or itself)
                int swapIndex = rng.Next(i + 1);
                T tmp = elements[i];
                elements[i] = elements[swapIndex];
                elements[swapIndex] = tmp;
            }
            // Lazily yield (avoiding aliasing issues etc)
            foreach (T element in elements)
            {
                yield return element;
            }
        }


        public static string FrameUserName(string fName, string lName)
        {
            if (!String.IsNullOrEmpty(fName) && !String.IsNullOrEmpty(lName))
            {
                List<long> userNames = db.UserRegistrations.Where(m => !String.IsNullOrEmpty(m.UserName)).Select(m => Convert.ToInt64(m.UserName.Substring(2))).ToList();
                if (userNames != null && userNames.Count() > 0)
                    return fName[0].ToString() + lName[0].ToString() + (userNames.Max() + 1).ToString("00000");
                else
                    return fName[0].ToString() + lName[0].ToString() + (userNames.Max() + 1).ToString("00000");
            }
            return "";
        }

        
    }
}