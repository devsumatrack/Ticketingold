using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Ticketing.Class
{
    
    public class Data
    {
        public static List<Data> InfosClient = new List<Data>();
        public string ID { get; set; }
        public string Nom { get; set; }
        public string Telephone { get; set; }
        public string Mail { get; set; }
    }
    public class DataIDTicket
    {
        public static List<DataIDTicket> InfosClient = new List<DataIDTicket>();
        public  string ID { get; set; }
    }
    public class DT
    {
        public static bool Modifier { get; set; }
        public static int ID { get; set; }
    }
    public class DTT
    {
        public static List<DTT> InfosClient = new List<DTT>();
        public string ID { get; set; }
    }

}