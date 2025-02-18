// Default.aspx.cs
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SuudeKaynak
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Sayfa yüklendiğinde yapılacak işlemler
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            // Kullanıcı bilgilerini al
            string name = NameTextBox.Text;
            string country = CountryDropdown.SelectedValue;
            string hobbies = "";
            foreach (ListItem item in HobbiesCheckBoxList.Items)
            {
                if (item.Selected)
                {
                    hobbies += item.Text + ", ";
                }
            }
            string gender = GenderRadioButtonList.SelectedValue;
            string birthDate = BirthDateCalendar.SelectedDate.ToShortDateString();

            // Sonuçları göster
            ResultLabel.Text = $"Name: {name}<br />Country: {country}<br />Hobbies: {hobbies}<br />Gender: {gender}<br />Birth Date: {birthDate}";

            // Önerilen yerleri göster
            ResultLabel.Text += "<br /><br />Recommended Places: ";
            string[] recommendedPlaces = { "Paris", "New York", "Tokyo", "London", "Sydney", "Rome", "Barcelona", "Dubai", "Berlin", "Moscow" };
            foreach (string place in recommendedPlaces)
            {
                ResultLabel.Text += place + ", ";
            }

            // Seçilen tarihi göster
            SelectedDateLabel.Text = "Selected Date: " + birthDate;
        }
    }
}