using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WorkoutSite
{
    public partial class Todo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //It's important to learn page "life cycle". When a page first loads a series of things happen in a certain order.
            //One of those things, and the one most commonly used is the "page_load". This function hits every time a page loads.
            //You can make a command here and it will happen every time the page loads.
            SetupThePage();

            //It's important to note that if you make a change here then press "save" and then refresh the browser you won't see the changes.
            //there's another step you need to take. You need to "build" the solution. This takes all the .cs files in the whole "solution" and "builds" them.
            //building means the code is compiled into a file that only a computer can read. All of these compiled files are put into a bin folder as .dll files.
            //go to the Documents folder/Zach/WorkoutPage/bin and you'll see the files in there if you've built at least once. 
            //These .dll files are the "brains" of your code. You'll also see a pdb file which you'll learn about later.

            //If you make a change to the .aspx file (not .cs file) then you don't need to recompile to see changes.
        }

        protected void SetupThePage()
        {
            lblMessage.Text = "Hello world";
            lblMessage.Text = lblMessage.Text + "<br />The current date/time is: " + DateTime.Now.ToString("");
            //Below is some c# code.

            //c# is stronly typed. That means you need to specify a variables types (string, integer, decimal, etc) when you declare it.
            //here I am declaring a string variable called messageToUser and setting it to nothing.
            string messageToUser = "";

            //Now I am going to do some logic.
            //If the current hour is greater than 19 OR ELSE less than 5
            if (DateTime.Now.Hour > 19 || DateTime.Now.Hour < 5)
            { //everything inside brackets goes together
                
                messageToUser = "Have a nice night!";
            }
            else
            {
                messageToUser = "Have a great day!";
            }

            lblMessage.Text = lblMessage.Text + "<br />" + messageToUser;


        }
    }
}