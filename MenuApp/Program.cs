using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MenuApp
{
    internal class Program
    {
        static void Main(string[] args)
        {





            string[] tableStatus = new string[7] { "boş", "boş", "boş", "boş", "boş", "boş", "boş" };
            int[] tableTotalBills = new int[7] { 0, 0, 0, 0, 0, 0, 0 };

            string[] foods = new string[4] { "Biftek", "Pizza", "Soğuk Kahve", "Çay" };
            int[] foodPrices = new int[4] { 10, 20, 30, 40 };

        x:

            Console.WriteLine("ANA MENÜ");
            Console.WriteLine("-------------------------------");
            Console.WriteLine("Masa Aç        [1]");
            Console.WriteLine("Masa İşlem     [2]");
            Console.WriteLine("Masa Hesap     [3]");
            Console.WriteLine("Kasa İşlemleri [4]");
            Console.WriteLine("-------------------------------");
            Console.WriteLine("ÇIKIŞ YAP      [0]");
            Console.WriteLine("-------------------------------");
            Console.Write("Seçiminiz: ");
            int secim = int.Parse(Console.ReadLine());
            Console.Clear();
            switch (secim)
            {
                case 1:
                    Console.Clear();
                    Console.WriteLine("-------------------------------");
                    Console.WriteLine("MASA AÇ");
                    Console.WriteLine("-------------------------------");

                    for (int i = 0; i < tableStatus.Length; i++)
                    {
                        Console.WriteLine($"{i + 1}. Masa [{tableStatus[i]}]");
                    }
                    /*
                    Console.WriteLine("1. Masa" + "[BOŞ]");
                    Console.WriteLine("2. Masa" + "[BOŞ]");
                    Console.WriteLine("3. Masa" + "[BOŞ]");
                    Console.WriteLine("4. Masa" + "[BOŞ]");
                    Console.WriteLine("5. Masa" + "[BOŞ]");
                    Console.WriteLine("6. Masa" + "[BOŞ]");
                    Console.WriteLine("7. Masa" + "[BOŞ]");
                    */
                    Console.WriteLine("-------------------------------");
                    Console.WriteLine("ANA MENÜ     [ESC]");
                    Console.WriteLine("-------------------------------");
                    Console.Write("Masa seç: ");

                    int masa_secim = int.Parse(Console.ReadLine());

                    if (tableStatus[masa_secim - 1] == "boş")
                    {
                        tableStatus[masa_secim - 1] = "dolu";
                        Console.Clear();
                        Console.WriteLine($"Masa {masa_secim} dolduruldu.");
                        goto x;
                    }
                    else
                    {
                        /*
                        Console.WriteLine("(1) Biftek");
                        Console.WriteLine("(2) Pizza");
                        Console.WriteLine("(3) Soğuk Kahve");
                        Console.WriteLine("(4) Çay");
                        */

                        for (int i = 0; i < foods.Length; i++)
                        {
                            Console.WriteLine($"({i + 1}) {foods[i]}");
                        }

                        int yemek_secim = int.Parse(Console.ReadLine());
                        Console.Clear();
                        Console.WriteLine($"{foods[yemek_secim - 1]} siparişiniz alınmıştır.");
                        tableTotalBills[masa_secim - 1] += foodPrices[yemek_secim - 1];
                        goto x;
                    }


                    break;


                case 2:
                    Console.WriteLine("2");
                    break;
                case 3:
                    Console.Clear();
                    Console.Write("Masa seç: ");
                    masa_secim = int.Parse(Console.ReadLine());
                    Console.WriteLine($"Masa {masa_secim} hesabı:{tableTotalBills[masa_secim - 1]}");
                    goto x;

                    break;
                default:
                    Console.WriteLine("yanlış veya hatalı değer girdiniz");
                    break;


            }





        }
    }
}
