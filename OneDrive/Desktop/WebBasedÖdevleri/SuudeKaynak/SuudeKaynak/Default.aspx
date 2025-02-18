<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SuudeKaynak.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Travel Preferences Form</title>
    <!-- Bootstrap ve Font Awesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
            --background-color: #ecf0f1;
        }

        body {
            background: var(--background-color);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            padding: 40px 0;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        }

        .form-container {
            background: white;
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
            max-width: 900px;
            margin: 0 auto;
            position: relative;
            overflow: hidden;
        }

        .form-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(90deg, var(--secondary-color), var(--accent-color));
        }

        .form-title {
            color: var(--primary-color);
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 40px;
            text-align: center;
            position: relative;
        }

        .form-title::after {
            content: '✈️';
            margin-left: 10px;
            font-size: 2rem;
        }

        .form-group {
            margin-bottom: 30px;
            position: relative;
            transition: all 0.3s ease;
        }

        .form-group:hover {
            transform: translateX(5px);
        }

        .form-label {
            color: var(--primary-color);
            font-weight: 600;
            font-size: 1.1rem;
            margin-bottom: 12px;
            display: block;
        }

        .form-control {
            border: 2px solid #e9ecef;
            border-radius: 10px;
            padding: 12px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: var(--secondary-color);
            box-shadow: 0 0 15px rgba(52, 152, 219, 0.1);
        }

        .form-select {
            border: 2px solid #e9ecef;
            border-radius: 10px;
            padding: 12px;
            height: auto;
        }

        .checkbox-list, .radio-list {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            border: 2px solid #e9ecef;
        }

        .checkbox-list label, .radio-list label {
            margin: 10px 0;
            padding: 10px;
            border-radius: 5px;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .checkbox-list label:hover, .radio-list label:hover {
            background: #e9ecef;
        }

        .calendar-container {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            border: 2px solid #e9ecef;
            margin-top: 10px;
        }

        .btn-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

        .btn-submit {
            background: linear-gradient(45deg, var(--secondary-color), #2ecc71);
            border: none;
            padding: 15px 40px;
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 30px;
            color: white;
            cursor: pointer;
            transition: all 0.3s ease;
            width: auto;
            min-width: 300px;
            text-align: center;
        }

        .btn-submit:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .result-container {
            margin-top: 40px;
            padding: 30px;
            background: #f8f9fa;
            border-radius: 15px;
            border: 2px solid #e9ecef;
            transition: all 0.3s ease;
        }

        .result-container:not(:empty) {
            animation: fadeIn 0.5s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Takvim Özelleştirmeleri */
        .calendar-container table {
            width: 100%;
            background: white;
            border-radius: 10px;
        }

        .calendar-container th {
            padding: 10px;
            background: var(--secondary-color);
            color: white;
        }

        .calendar-container td {
            padding: 8px;
            text-align: center;
        }

        /* Responsive Düzenlemeler */
        @media (max-width: 768px) {
            .form-container {
                margin: 20px;
                padding: 20px;
            }

            .form-title {
                font-size: 2rem;
            }

            .btn-submit {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container form-container">
            <h2 class="form-title">Travel Profile</h2>
            
            <!-- Kullanıcı Adı -->
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Your Name" CssClass="form-label">
                    <i class="fas fa-user me-2"></i>Name
                </asp:Label>
                <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control" placeholder="Enter your name"></asp:TextBox>
            </div>

            <!-- Ülke Seçimi -->
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="Country" CssClass="form-label">
                    <i class="fas fa-globe-americas me-2"></i>Country
                </asp:Label>
                <asp:DropDownList ID="CountryDropdown" runat="server" CssClass="form-select">
                    <asp:ListItem Text="Select your country" Value="" />
                    <asp:ListItem Text="USA" Value="USA" />
                    <asp:ListItem Text="UK" Value="UK" />
                    <asp:ListItem Text="Germany" Value="Germany" />
                    <asp:ListItem Text="Turkey" Value="Turkey" />
                </asp:DropDownList>
            </div>

            <!-- Hobiler -->
            <div class="form-group">
                <asp:Label ID="Label3" runat="server" Text="Interests" CssClass="form-label">
                    <i class="fas fa-heart me-2"></i>What do you enjoy?
                </asp:Label>
                <div class="checkbox-list">
                    <asp:CheckBoxList ID="HobbiesCheckBoxList" runat="server" CssClass="list-unstyled">
                        <asp:ListItem Text="📚 Reading" Value="Reading" />
                        <asp:ListItem Text="🏃 Sports" Value="Sports" />
                        <asp:ListItem Text="✈️ Traveling" Value="Traveling" />
                        <asp:ListItem Text="🎵 Music" Value="Music" />
                        <asp:ListItem Text="🎨 Art" Value="Art" />
                        <asp:ListItem Text="🎮 Gaming" Value="Gaming" />
                        <asp:ListItem Text="🌱 Gardening" Value="Gardening" />
                        <asp:ListItem Text="📷 Photography" Value="Photography" />
                    </asp:CheckBoxList>
                </div>
            </div>

            <!-- Cinsiyet Seçimi -->
            <div class="form-group">
                <asp:Label ID="Label4" runat="server" Text="Gender" CssClass="form-label">
                    <i class="fas fa-venus-mars me-2"></i>Gender
                </asp:Label>
                <div class="radio-list">
                    <asp:RadioButtonList ID="GenderRadioButtonList" runat="server" CssClass="list-unstyled">
                        <asp:ListItem Text="👨 Male" Value="Male" />
                        <asp:ListItem Text="👩 Female" Value="Female" />
                    </asp:RadioButtonList>
                </div>
            </div>

            <!-- Doğum Tarihi -->
            <div class="form-group">
                <asp:Label ID="Label5" runat="server" Text="Birth Date" CssClass="form-label">
                    <i class="fas fa-calendar me-2"></i>When were you born?
                </asp:Label>
                <div class="calendar-container">
                    <asp:Calendar ID="BirthDateCalendar" runat="server" CssClass="w-100">
                        <TodayDayStyle BackColor="#3498db" ForeColor="White" />
                        <SelectedDayStyle BackColor="#2ecc71" ForeColor="White" />
                        <DayStyle BorderWidth="1px" BorderColor="#e9ecef" />
                        <TitleStyle BackColor="#2c3e50" ForeColor="White" />
                    </asp:Calendar>
                    <asp:Label ID="SelectedDateLabel" runat="server" Text="Selected Date: " CssClass="mt-3 d-block text-muted"></asp:Label>
                </div>
            </div>

            <!-- Gönder Butonu -->
            <div class="btn-container">
                <asp:Button ID="SubmitButton" runat="server" Text="Get Travel Recommendations" OnClick="SubmitButton_Click" CssClass="btn btn-submit" />
            </div>

            <!-- Sonuçları Göster -->
            <div class="result-container">
                <asp:Label ID="ResultLabel" runat="server" Text="" CssClass="d-block"></asp:Label>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>