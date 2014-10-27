using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Workout
{
    public partial class redo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1Add(object sender, EventArgs e)
        {
            try
            {
                if (textBox1.Text == "")
                {
                    lblError.Text = "Oops, the left box is blank.";
                    lblAnswer.Text = "";
                    return;
                }
                string textBox1Value = textBox1.Text;
                int value1;
                if (!int.TryParse(textBox1Value, out value1))
                {
                    lblError.Text = "Oops, the left box must contain an integer.";
                    lblAnswer.Text = "";
                    return;
                }
                if (textBox2.Text == "")
                {
                    lblError.Text = "Oops, the right box is blank.";
                    lblAnswer.Text = "";
                    return;
                }
                string textBox2Value = textBox2.Text;
                int value2;
                if (!int.TryParse(textBox2Value, out value2))
                {
                    lblError.Text = "Oops, the right box must contain an integer.";
                    lblAnswer.Text = "";
                    return;
                }
                else
                {
                    int answer = value1 / value2;
                    lblAnswer.Text = "The answer is " + answer;
                    lblError.Text = "";
                }
            }
            catch(DivideByZeroException ex)
            {
                lblError.Text = "You cannot divide by zero!";
                lblAnswer.Text = "";
            }
            catch (Exception ex)
            {
                lblError.Text = "Sorry, an excpetion has occured " + ex.ToString();
                lblAnswer.Text = "";
            }

        }
    }
}