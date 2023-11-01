using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DashBoard.Models;

namespace DashBoard_UI
{
    public partial class Form1 : Form
    {
        //Fields
        private Dashboard model;

        //Constructor
        public Form1()
        {
            InitializeComponent();
            //Default - Last 7 Days
            dtpStartDate.Value = DateTime.Today.AddDays(-7);
            dtpEndDate.Value = DateTime.Now;
            btnLast7Days.Select();

            model = new Dashboard();
            LoadData();
        }

        private void LoadData() 
        {
            var refreshData = model.LoadData(dtpStartDate.Value, dtpEndDate.Value);
            if (refreshData)
            {
                lblNumberOrder.Text = model.NumOrders.ToString();
                lblTotalRevenue.Text = "$" + model.TotalRevenue.ToString();
                lblTotalProfit.Text = "$" + model.TotalProfit.ToString();

                lblNumberCustomer.Text = model.NumCustomers.ToString();
                lblNumberSupplier.Text = model.NumSuppliers.ToString();
                lblNumberProduct.Text = model.NumProducts.ToString();

                chart1.DataSource = model.GrossRevenueList;
                chart1.Series[0].XValueMember = "Date";
                chart1.Series[0].YValueMembers = "TotalAmount";
                chart1.DataBind();

                chart2.DataSource = model.TopProductsList;
                chart2.Series[0].XValueMember = "Key";
                chart2.Series[0].YValueMembers = "Value";
                chart2.DataBind();

                dgvUnderstock.DataSource = model.UnderstockList;
                Console.WriteLine("Loaded View");
            }
            else 
            {
                Console.WriteLine("View not loaded, same query");
            }
        }

        private void btnThisMonth_Click(object sender, EventArgs e)
        {

        }

        private void btnLast30Days_Click(object sender, EventArgs e)
        {

        }

        private void btnLast7Days_Click(object sender, EventArgs e)
        {

        }

        private void btnToday_Click(object sender, EventArgs e)
        {

        }

        private void btnCustom_Click(object sender, EventArgs e)
        {

        }
    }
}
