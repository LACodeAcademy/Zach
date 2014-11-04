        using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WorkoutSite
{
    public partial class Adding : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1Add(object sender, EventArgs e)
        {
            try
            {

                if (TextBox1.Text == "")
                {
                    lblError.Text = "OOPS! The first box is empty.";
                    return;
                }
                string textBox1Value = TextBox1.Text;
                int value1;
                if (!int.TryParse(textBox1Value, out value1))
                {
                    lblError.Text = "OOPS! The fist value is not an integer.";
                    return;
                }

                if (TextBox2.Text == "")
                {
                    lblError.Text = "OOPS! The second box is empty.";
                    return;
                }
                string textbox2Value = TextBox2.Text;
                int Value2;

                if (!int.TryParse(textbox2Value, out Value2))
                {
                    lblError.Text = "OOPS! The second value is not an integer.";
                    return;
                }
                int Answer = value1 / Value2;
                lblAnswer.Text = "The Answer is " + Answer;
            }
            catch (DivideByZeroException ex)
            {
                lblError.Text = "You cannot divide by zero!";
            }
            catch (SqlException ex)
            {
                lblError.Text = "An exception with your database occurred. " + ex.ToString();
            }
            catch (Exception ex)
            {
                lblError.Text = "An exception has occured. " + ex.ToString();
            }
        }
    }
}