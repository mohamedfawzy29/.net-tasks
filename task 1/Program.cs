namespace task_1
{
    internal class Program
    {
        const int smallCarpetPrice = 25;
        const int largeCarpetPrice = 35;
        static void Main(string[] args)
        {
            int numberOfSmallCarpets, numberOfLargeCarpets;
            double costWithoutTax;
            Console.WriteLine("Estimate for carpet cleaning service : ");
            Console.Write("Enter the number of small carpets : ");
            numberOfSmallCarpets = Convert.ToInt32(Console.ReadLine());
            Console.Write("Enter the number of large carpets : ");
            numberOfLargeCarpets = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Price per small room: " + smallCarpetPrice + "$");
            Console.WriteLine("Price per large room: " + largeCarpetPrice + "$");
            costWithoutTax = ((numberOfSmallCarpets * smallCarpetPrice) + (numberOfLargeCarpets * largeCarpetPrice));
            Console.WriteLine("cost : " + costWithoutTax + "$");
            Console.WriteLine("Tax : " + costWithoutTax*6/100 + "$");
            Console.WriteLine("-----------------------------------------------------");
            Console.WriteLine("Total Estimate : " + (costWithoutTax + (costWithoutTax * 6 / 100)) + "$");
            Console.WriteLine("This estimate is valid for 30 days");

        }
    }
}
