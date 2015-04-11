﻿<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="Preferences.aspx.cs" Inherits="SOEN341_nobean.Preferences" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
    <link rel="stylesheet" href="master.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Stylesheets" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Preferences</h2>
    <asp:Button runat="server" Text="Edit" ID="editPreferencesBtnTop" OnClick="editPreferences" />
    <asp:Button runat="server" Text="Save" ID="savePreferencesBtnTop" OnClientClick="if (!validateSave()) {return false;}" OnClick="savePreferences"  Visible="false" />
    <br />
<div id="allprefs">
    <h3 style="margin-top:10px;">General Electives</h3>
    <div>
        <p style="font-size:12pt;font-style:italic">Select a minimum of one general elective from the list below.</p>
        <asp:CheckBoxList runat="server" ID="ChkLstGeneral" TextAlign="Right" Font-Size="Medium"></asp:CheckBoxList>
    </div>   
    <h3 style="margin-top:10px">Technical Electives</h3>
    <div>
        <p style="font-size:12pt;font-style:italic">Select a minimum of five technical electives from the list below.</p>
        <asp:CheckBoxList runat="server" ID="ChkLstTechnical" TextAlign="Right" Font-Size="Medium"></asp:CheckBoxList>
    </div>
    <h3 style="margin-top:10px">Basic Science Electives</h3>  
    <div>
        <p style="font-size:12pt;font-style:italic">Select a minimum of two science electives from the list below.</p>
        <asp:CheckBoxList runat="server" ID="ChkLstScience" TextAlign="Right" Font-Size="Medium"></asp:CheckBoxList>
    </div>
</div>
    <asp:Button runat="server" style="margin-top:10px" Text="Edit" ID="editPreferencesBtnBottom" OnClick="editPreferences" />
    <asp:Button runat="server" Text="Save" ID="savePreferencesBtnBottom" OnClientClick="if (!validateSave()) {return false;}" OnClick="savePreferences"  Visible="false" />
   

    <asp:Label runat="server" ID="testLabel" ></asp:Label>
    
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script type="text/javascript">

        $(function () {
            $(document).tooltip({
                track: false,
                open: function (event, ui) {
                    ui.tooltip.css("max-width", "1000px");
                }
            });
        });
        $(function () {
            $("#allprefs").accordion({
                active: false,
                collapsible: true,
                heightStyle: "content",
                activate: function (event, ui) {
                    if (!$.isEmptyObject(ui.newHeader.offset())) {
                        $('html:not(:animated), body:not(:animated)').animate({ scrollTop: ui.newHeader.offset().top }, 'medium');
                    }
                }
            });
        });

        function validateSave() {
            //minimum number of classes needed to be selected
            var minimumGeneral = 1;
            var minimumTechnical = 5;
            var minimumScience = 2;
            //General validate
            var chkListNumber = 0;
            var chkListinputs = document.getElementById('<%= ChkLstGeneral.ClientID %>').getElementsByTagName("input");
            for (var i = 0; i < chkListinputs.length; i++) {
                if (chkListinputs[i].checked) {
                    chkListNumber++;
                }
            }
            if (chkListNumber < minimumGeneral) {
                alert("You must choose a minimum of " + minimumGeneral + " general electives.");
                return false;
            }
            //technical validate
            chkListNumber = 0;
            var chkListinputs = document.getElementById('<%= ChkLstTechnical.ClientID %>').getElementsByTagName("input");
            for (var i = 0; i < chkListinputs.length; i++) {
                if (chkListinputs[i].checked) {
                    chkListNumber++;
                }
            }
            if (chkListNumber < minimumTechnical) {
                alert("You must choose a minimum of " + minimumTechnical + " technical electives.");
                return false;
            }   
            //science validate
            chkListNumber = 0;
            var chkListinputs = document.getElementById('<%= ChkLstScience.ClientID %>').getElementsByTagName("input");
            for (var i = 0; i < chkListinputs.length; i++) {
                if (chkListinputs[i].checked) {
                    chkListNumber++;
                }
            }
            if (chkListNumber < minimumScience) {
                alert("You must choose a minimum of " + minimumScience + " basic science electives.");
                return false;
            }      
            return true;
        }
    </script>
</asp:Content>
