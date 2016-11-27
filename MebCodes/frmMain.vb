﻿Imports Microsoft.Win32

Public Class frmMain
    Dim il, ilce, sayfa, no As Integer, ad As String, sayfaVar, isLoaded As Boolean
    Dim db As MEBEntities = New MEBEntities()
    Dim alanlar() = {"Tel", "Fax", "WEB", "Adres", "Vizyon", "Misyon", "Basarilar", "OgretmenSayi", "RehberSayi", "OgrenciSayi", "DerslikSayi", "MuzikSayi", "ResimSayi", "BtSayi", "Misafirhane", "Kutuphane", "LabSayi", "Hazirlik", "Konferans", "AtolyeSayi", "Spor", "OgretimSekli", "Yemekhane", "Kantin", "Revir", "Bahce", "DersSaati", "Isinma", "Internet", "Yabancı Dil", "Pansiyon Bilgileri", "LojmanSayi", "LojmanSayi", "Ulasim", "Servis", "Yerlesim", "Uzaklik", "Kontenjan", "PuanBilgi", "BasariDurumu", "YerlestirmeYuzde", "SporEtkinlik", "BilimEtkinlik", "Projeler", "YurtdisiProje"}
    Dim alanlar1() = {"Telefon", "Belgegeçer", "WEB", "Adres", "Vizyon", "Misyon", "Başarılar", "Öğretmen ", "Rehber Öğretmen ", "Öğrenci ", "Derslik", "Müzik Sınıfı", "Resim Sınıfı", "BT Sınıfı", "Misafirhane", "Kütüphane", "Fen Labaratuarı", "Hazırlık Sınıfı", "Konferans Salonu", "Atölye-İşlik", "Spor Salonu", "Öğretim Şekli", "Yemekhane", "Kantin", "Revir", "Bahçe", "Saatler", "Isınma", "Bağlantı", "Yabancı Dil", "Pansiyon Bilgileri", "Lojman", "Sayısı", "Ulaşım", "Servis Bilgisi", "Yerleşim Yeri", "İl/İlçe Merkezine Uzaklık", "Kontenjan Bilgileri", "Taban-Tavan Puan Bilgileri", "Okulun YGS/LYS Başarı Durumu", "LYS'de Öğrenci Yerleştirme Yüzdesi", "Sportif Etkinlikler", "Bilimsel Etkinlikler", "Proje Çalışmaları", "Yurtdışı Proje Faaliyetleri"}
    Dim alanlar2() = {"Telefon", "Belgegeçer", "WEB", "Adres", "VİZYON", "MİSYON", "BAŞARILAR", "Öğretmen ", "Rehber Öğretmen ", "Öğrenci ", "Derslik", "Müzik Sınıfı", "Resim Sınıfı", "BT Sınıfı", "Misafirhane", "Kütüphane", "Fen Labaratuarı", "Hazırlık Sınıfı", "Konferans Salonu", "Atölye-İşlik", "Spor Salonu", "Öğretim Şekli", "Yemekhane", "Kantin", "Revir", "Bahçe", "Saatler", "Isınma", "Bağlantı", "Yabancı Dil", "Pansiyon Bilgileri", "Lojman", "Sayısı", "Ulaşım", "Servis Bilgisi", "Yerleşim Yeri", "İl/İlçe Merkezine Uzaklık", "Kontenjan Bilgileri", "Taban-Tavan Puan Bilgileri", "Okulun YGS/LYS Başarı Durumu", "LYS'de Öğrenci Yerleştirme Yüzdesi", "Sportif Etkinlikler", "Bilimsel Etkinlikler", "Proje Çalışmaları", "Yurtdışı Proje Faaliyetleri"}
    'frm load
    Private Sub frmMain_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'SetBrowserFeatureControl()
        'InitializeComponent()
        Me.Show()
    End Sub
    'resize
    Private Sub frmMain_Resize(sender As Object, e As EventArgs) Handles Me.Resize
        WebBrowser1.Height = Me.Height - 70
        txtLists.Height = Me.Height - 100
    End Sub
    'tüm ilcelerde döngü yap
    Private Sub btnStart_Click(sender As Object, e As EventArgs) Handles btnStart.Click
        Dim tbl = db.Ilces.Where(Function(m) m.IlNo > 50).OrderBy(Function(m) m.IlNo).ThenBy(Function(m) m.Kod).ToList()
        For Each item In tbl
            il = item.IlNo
            ilce = item.Kod
            sayfa = 1
            sayfaVar = True
            ad = db.GetIlceAd(il, ilce).FirstOrDefault()
            Do While sayfaVar = True
                isLoaded = False
                ReloadFrame()
                Do While isLoaded = False
                    Threading.Thread.Sleep(1000)
                    Application.DoEvents()
                Loop
                sayfa += 1
            Loop
        Next
    End Sub
    'okul ayrıntılarını kaydet
    Private Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click
        Me.Enabled = False
        Dim tbl = db.Okuls.OrderBy(Function(m) m.No).ToList()
        Me.Enabled = True
        For Each item In tbl
            isLoaded = False
            'ad = "http://abdulkadirpaksoyanadolulisesi.meb.k12.tr" : ReloadFrame("http://abdulkadirpaksoyanadolulisesi.meb.k12.tr/meb_iys_dosyalar/01/01/111573/okulumuz_hakkinda.html")
            ad = item.Url : ReloadFrame(item.HakkindaUrl) : no = item.No
            Do While isLoaded = False
                Threading.Thread.Sleep(1000)
                Application.DoEvents()
                'isLoaded = True
            Loop
        Next
    End Sub
    'web browser
    Private Sub WebBrowser_DocumentCompleted(sender As Object, e As WebBrowserDocumentCompletedEventArgs) Handles WebBrowser1.DocumentCompleted
        Try
            UpdateSchools()
        Catch ex As ArgumentException

        End Try
        Application.DoEvents() : isLoaded = True
    End Sub
    'illeri bulur
    Private Sub GenerateCities()
        'iller
        Dim allelements As HtmlElementCollection = WebBrowser1.Document.All
        For Each webpageelement As HtmlElement In allelements
            If webpageelement.Id = "jumpMenu5" Then txtLists.Text = webpageelement.InnerHtml
        Next
        txtLists.Text = txtLists.Text.Replace("<option value="""">İL</option>", "")
        txtLists.Text = txtLists.Text.Replace(" selected=""selected""", "")
        txtLists.Text = txtLists.Text.Replace("</option>", vbCrLf)
        txtLists.Text = txtLists.Text.Replace("<option value=""?ILKODU=", "")
        txtLists.Text = txtLists.Text.Replace(""">", vbTab)
    End Sub
    'ilçeleri bulur
    Private Sub GenerateTowns()
        'ilçeler
        Dim allelements As HtmlElementCollection = WebBrowser1.Document.All
        For Each webpageelement As HtmlElement In allelements
            If webpageelement.Id = "jumpMenu6" Then txtLists.Text = webpageelement.InnerHtml
        Next
        txtLists.Text = txtLists.Text.Replace("<option value=""?ILKODU=" & il & "&amp;ILCEKODU=0"">Tüm ilçeler</option>", "")
        txtLists.Text = txtLists.Text.Replace(" selected=""selected""", "")
        txtLists.Text = txtLists.Text.Replace("</option>", vbCrLf)
        txtLists.Text = txtLists.Text.Replace("<option value=""?ILKODU=" & il & "&amp;ILCEKODU=", "1" & vbTab & il & vbTab)
        txtLists.Text = txtLists.Text.Replace(""">", vbTab)
    End Sub
    'okulları bulur
    Private Sub GenerateSchools()
        'okullar
        Dim allelements As HtmlElementCollection = WebBrowser1.Document.GetElementsByTagName("table")
        For Each webpageelement As HtmlElement In allelements
            If webpageelement.TagName.ToLower() = "table" And webpageelement.GetAttribute("classname") = "table" Then
                txtLists.Text = webpageelement.InnerHtml
            End If
        Next
        'gereksiz veriyi sil
        txtLists.Text = txtLists.Text.Replace("<tbody>", "").Replace("</tbody>", "")
        txtLists.Text = txtLists.Text.Replace("<th></th>", "").Replace("<th>Harita</th>", "").Replace("<th>Bilgi</th>", "")
        txtLists.Text = txtLists.Text.Replace("</tr>", vbCrLf).Replace("<tr>", "").Replace(" align=""center""", "").Replace("<td>", "").Replace("</td>", vbTab)
        txtLists.Text = txtLists.Text.Replace("<a href=""", "").Replace(" target=""_blank"">", vbTab).Replace("</a>", "").Replace("<img src=""Help-icon.png"" border=""0"">", "")
        txtLists.Text = txtLists.Text.Replace("<img class=""harita"" style=""border: currentColor; border-image: none;"" src=""Maps-icon.png"" border=""0"" data-host=""", "").Replace("data-veri=", "")
        txtLists.Text = txtLists.Text.Replace("""", "").Replace(">", "").Replace("  ", " ").Replace(ad, " ")
        txtLists.Text = txtLists.Text.Trim()
        'kaydet ve geç
        If txtLists.Text = "" Then
            sayfaVar = False
        Else
            For Each line In txtLists.Text.Split(vbCrLf)
                'tabla ayrılmış olanlara bak
                Dim items = line.Split(vbTab)
                'kurum kodunu bul
                Dim kod = items(2).Replace(items(0) & "/meb_iys_dosyalar/", "").Replace("/okulumuz_hakkinda.html", "")
                kod = kod.Remove(0, kod.IndexOf("/") + 1)
                kod = kod.Remove(0, kod.IndexOf("/") + 1)
                'kaydet
                If items.Count > 1 Then Dim sonuc = db.InsertSchool(il, ilce, items(1), items(0), items(2), kod)
            Next
        End If
    End Sub
    'okulları günceller
    Private Sub UpdateSchools()
        'okul ayrıntıları
        Dim webelement As HtmlElement = WebBrowser1.Document.GetElementById("hakkinda_kutu")
        'div ise
        If IsNothing(webelement) = False Then
            txtLists.Text = webelement.InnerHtml
            txtLists.Text = txtLists.Text.Replace("col-sm-12", "").Replace("row", "").Replace("col-sm-1 col-xs-2 text-center", "").Replace("col-xs-3 text-center", "").Replace("col-sm-8 col-xs-7", "").Replace("col-sm-4", "").Replace(" id=""hakkinda_kutu_2""", "")
            txtLists.Text = txtLists.Text.Replace(" fa-phone", "").Replace(" fa-envelope-o", "").Replace(" fa-envelope", "").Replace(" fa-globe", "").Replace(" fa-map-marker", "").Replace(" fa-flag-o", "").Replace(" fa-flag", "")
            txtLists.Text = txtLists.Text.Replace(" fa-graduation-cap", "").Replace(" fa-user", "").Replace(" fa-child", "").Replace(" fa-picture-o", "").Replace(" fa-music", "").Replace(" fa-building-o", "")
            txtLists.Text = txtLists.Text.Replace(" fa-fax", "").Replace(" fa-building", "").Replace(" fa-laptop", "").Replace(" fa-bed", "").Replace(" fa-fa", "").Replace(" fa-university", "").Replace(" fa-flask", "").Replace(" fa-microphone", "").Replace(" fa-wrench", "").Replace(" fa-futbol-o", "")
            txtLists.Text = txtLists.Text.Replace(" fa-code-fork", "").Replace(" fa-cutlery", "").Replace(" fa-heartbeat", "").Replace(" fa-tree", "").Replace(" fa-clock-o", "").Replace(" fa-wifi", "").Replace(" fa-language", "")
            txtLists.Text = txtLists.Text.Replace(" fa-print", "").Replace(" fa-fire", "").Replace(" fa-home", "").Replace(" fa-subway", "").Replace(" fa-thumb-tack", "").Replace(" fa-street-view", "").Replace(" fa-line-chart", "").Replace(" fa-info", "")
            txtLists.Text = txtLists.Text.Replace(" name=""chk_misafirhane""", "").Replace(" name=""chk_konferanssalonu""", "").Replace(" name=""chk_sporsalonu""", "").Replace(" name=""chk_kantin""", "").Replace(" name=""chk_bahce""", "").Replace(" name=""chk_revir""", "").Replace(" name=""chk_yemekhane""", "")
            txtLists.Text = txtLists.Text.Replace(" style=""clear: both;""", "").Replace("<a title=""Eposta Gönder"" class=""thickbox"" href=""" & ad & "/www/eposta/eposta_gonder.php?KeepThis=true&amp;width=530&amp;height=400&amp;TB_iframe=true"" target=""_blank"">Göndermek için tıklayınız</a>", "")
            txtLists.Text = txtLists.Text.Replace("<a onclick=""window.print();return false""><img src=""/tema/tema/3/img/printButton.png""></a>", "")
            txtLists.Text = txtLists.Text.Replace("Eposta", "").Replace("Yazdır", "").Replace(" class=""""", "").Replace("<input ", "").Replace("<span>", "").Replace("</span>", "")
            txtLists.Text = txtLists.Text.Replace("<i class=""fa""></i>", "").Replace("<input>", "").Replace("<div>", "").Replace("</div>", "").Replace(vbTab, "").Replace("&lt;", "")
        Else 'table ise
            Dim allelements As HtmlElementCollection = WebBrowser1.Document.GetElementsByTagName("table")
            For Each webpageelement As HtmlElement In allelements
                If webpageelement.TagName.ToLower() = "table" And webpageelement.GetAttribute("classname") = "table" Then
                    txtLists.Text = webpageelement.InnerHtml
                    txtLists.Text = txtLists.Text.Replace(" colspan=""3""", "").Replace(" width=""15""", "").Replace(" width=""100""", "").Replace(" width=""100""", "").Replace(" width=""100%""", "").Replace("noprint", "").Replace("bordernone", "")
                    txtLists.Text = txtLists.Text.Replace(" disabled=""disabled""", "").Replace(" class=""""", "").Replace(" type=""checkbox""", "").Replace(" value=""""", "").Replace("=""""", "")
                    txtLists.Text = txtLists.Text.Replace(" fa-phone", "").Replace(" fa-envelope", "").Replace(" fa-globe", "").Replace(" fa-map-marker", "").Replace(" fa-flag-o", "").Replace(" fa-flag", "")
                    txtLists.Text = txtLists.Text.Replace(" fa-graduation-cap", "").Replace(" fa-user", "").Replace(" fa-child", "").Replace(" fa-picture-o", "").Replace(" fa-music", "").Replace(" fa-building-o", "")
                    txtLists.Text = txtLists.Text.Replace(" fa-fax", "").Replace(" fa-building", "").Replace(" fa-laptop", "").Replace(" fa-bed", "").Replace(" fa-university", "").Replace(" fa-flask", "").Replace(" fa-microphone", "").Replace(" fa-wrench", "").Replace(" fa-futbol-o", "")
                    txtLists.Text = txtLists.Text.Replace(" fa-code-fork", "").Replace(" fa-cutlery", "").Replace(" fa-heartbeat", "").Replace(" fa-tree", "").Replace(" fa-clock-o", "").Replace(" fa-wifi", "").Replace(" fa-language", "")
                    txtLists.Text = txtLists.Text.Replace(" fa-print", "").Replace(" fa-fire", "").Replace(" fa-home", "").Replace(" fa-subway", "").Replace(" fa-thumb-tack", "").Replace(" fa-street-view", "").Replace(" fa-line-chart", "").Replace(" fa-info", "")
                    txtLists.Text = txtLists.Text.Replace(" name=""chk_misafirhane""", "").Replace(" name=""chk_konferanssalonu""", "").Replace(" name=""chk_sporsalonu""", "").Replace(" name=""chk_kantin""", "").Replace(" name=""chk_bahce""", "").Replace(" name=""chk_revir""", "").Replace(" name=""chk_yemekhane""", "")
                    txtLists.Text = txtLists.Text.Replace("<i class=""fa""></i>", "").Replace("<input>", "").Replace("<input ", "").Replace(vbTab, "")
                    txtLists.Text = txtLists.Text.Replace("<table>", "").Replace("</table>", "").Replace("<tbody>", "").Replace("</tbody>", "")
                    txtLists.Text = txtLists.Text.Replace("</tr>", "").Replace("<tr>", "").Replace("<td>", "").Replace("</td>", "")
                    txtLists.Text = txtLists.Text.Replace("<a href=""" & ad & "/tema/eposta/eposta_gonder.php?CHK=&amp;iframe=true&amp;width=600&amp;height=550"" rel=""prettyPhoto"">Göndermek için tıklayınız</a>", "")
                    txtLists.Text = txtLists.Text.Replace("<a style=""opacity: 1;"" onclick=""window.print();return false"" href=""#print""><img src=""http://www.meb.gov.tr/www/images/ico/printButton.png""></a>", "")
                    txtLists.Text = txtLists.Text.Replace("Eposta", "").Replace("Yazdır :", "").Replace(">", "").Replace("&lt;", "")
                    Exit For
                End If
            Next
        End If
        'clean empty lines
        txtLists.Text = txtLists.Text.Trim()
        Dim items = txtLists.Text.Split(vbLf), line = ""
        For Each item In items
            If item.Trim() <> "" Then line &= item.Trim() & vbLf
        Next
        txtLists.Text = line
        'kaydet ve geç
        If txtLists.Text <> "" Then
            Dim ix As Integer = 0, adVar As Boolean, totalStr = ""
            items = txtLists.Text.Split(vbLf)
            For Each item In items
                adVar = False
                'ix bulunur
                For i = 0 To alanlar1.Length - 1
                    If Strings.Left(item, alanlar1(i).Length) = alanlar1(i) Or Strings.Left(item, alanlar1(i).Length) = alanlar2(i) Then
                        ix = i : adVar = True : totalStr = "" : Exit For
                    End If
                Next
                If adVar = True Then
                    'belki deger buradadır
                    item = item.Replace(alanlar1(ix), "").Replace(alanlar2(ix), "").Replace(":", "").Trim()
                    If item <> "" Then
                        Dim s = db.UpdateSchool(no, alanlar(ix), item.Replace("checked", "1"))
                    End If
                Else
                    If totalStr <> "" Then totalStr &= ", "
                    totalStr &= item.Replace("checked", "1")
                    Dim s = db.UpdateSchool(no, alanlar(ix), totalStr)

                End If

            Next
        End If
    End Sub
    'reload frame
    Private Sub ReloadFrame(Optional url As String = "")
        If url = "" Then url = "http://www.meb.gov.tr/baglantilar/okullar/?ILKODU=" & il & "&ILCEKODU=" & ilce & "&SAYFANO=" & sayfa
        lblUrl1.Text = url.Replace("&", "&&") : WebBrowser1.Navigate(url) ', "_top", Nothing, "User-Agent: Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Safari/537.36")
    End Sub
    'xtra
    Private Sub SetBrowserFeatureControlKey(feature As String, appName As String, value As UInteger)
        Using key = Registry.CurrentUser.CreateSubKey([String].Concat("Software\Microsoft\Internet Explorer\Main\FeatureControl\", feature), RegistryKeyPermissionCheck.ReadWriteSubTree)
            key.SetValue(appName, value, RegistryValueKind.DWord)
        End Using
    End Sub
    Private Sub SetBrowserFeatureControl()
        ' http://msdn.microsoft.com/en-us/library/ee330720(v=vs.85).aspx

        ' FeatureControl settings are per-process
        Dim fileName = System.IO.Path.GetFileName(Process.GetCurrentProcess().MainModule.FileName)

        ' make the control is not running inside Visual Studio Designer
        If [String].Compare(fileName, "devenv.exe", True) = 0 OrElse [String].Compare(fileName, "XDesProc.exe", True) = 0 Then
            Return
        End If

        SetBrowserFeatureControlKey("FEATURE_BROWSER_EMULATION", fileName, GetBrowserEmulationMode())
        ' Webpages containing standards-based !DOCTYPE directives are displayed in IE10 Standards mode.
        SetBrowserFeatureControlKey("FEATURE_AJAX_CONNECTIONEVENTS", fileName, 1)
        SetBrowserFeatureControlKey("FEATURE_ENABLE_CLIPCHILDREN_OPTIMIZATION", fileName, 1)
        SetBrowserFeatureControlKey("FEATURE_MANAGE_SCRIPT_CIRCULAR_REFS", fileName, 1)
        SetBrowserFeatureControlKey("FEATURE_DOMSTORAGE ", fileName, 1)
        SetBrowserFeatureControlKey("FEATURE_GPU_RENDERING ", fileName, 1)
        SetBrowserFeatureControlKey("FEATURE_IVIEWOBJECTDRAW_DMLT9_WITH_GDI  ", fileName, 0)
        SetBrowserFeatureControlKey("FEATURE_DISABLE_LEGACY_COMPRESSION", fileName, 1)
        SetBrowserFeatureControlKey("FEATURE_LOCALMACHINE_LOCKDOWN", fileName, 0)
        SetBrowserFeatureControlKey("FEATURE_BLOCK_LMZ_OBJECT", fileName, 0)
        SetBrowserFeatureControlKey("FEATURE_BLOCK_LMZ_SCRIPT", fileName, 0)
        SetBrowserFeatureControlKey("FEATURE_DISABLE_NAVIGATION_SOUNDS", fileName, 1)
        SetBrowserFeatureControlKey("FEATURE_SCRIPTURL_MITIGATION", fileName, 1)
        SetBrowserFeatureControlKey("FEATURE_SPELLCHECKING", fileName, 0)
        SetBrowserFeatureControlKey("FEATURE_STATUS_BAR_THROTTLING", fileName, 1)
        SetBrowserFeatureControlKey("FEATURE_TABBED_BROWSING", fileName, 1)
        SetBrowserFeatureControlKey("FEATURE_VALIDATE_NAVIGATE_URL", fileName, 1)
        SetBrowserFeatureControlKey("FEATURE_WEBOC_DOCUMENT_ZOOM", fileName, 1)
        SetBrowserFeatureControlKey("FEATURE_WEBOC_POPUPMANAGEMENT", fileName, 0)
        SetBrowserFeatureControlKey("FEATURE_WEBOC_MOVESIZECHILD", fileName, 1)
        SetBrowserFeatureControlKey("FEATURE_ADDON_MANAGEMENT", fileName, 0)
        SetBrowserFeatureControlKey("FEATURE_WEBSOCKET", fileName, 1)
        SetBrowserFeatureControlKey("FEATURE_WINDOW_RESTRICTIONS ", fileName, 0)
        SetBrowserFeatureControlKey("FEATURE_XMLHTTP", fileName, 1)
    End Sub
    Private Function GetBrowserEmulationMode() As UInt32
        Dim browserVersion As Integer = 7
        Using ieKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\Microsoft\Internet Explorer", RegistryKeyPermissionCheck.ReadSubTree, System.Security.AccessControl.RegistryRights.QueryValues)
            Dim version = ieKey.GetValue("svcVersion")
            If version Is Nothing Then
                version = ieKey.GetValue("Version")
                If version Is Nothing Then
                    Throw New ApplicationException("Microsoft Internet Explorer is required!")
                End If
            End If
            Integer.TryParse(version.ToString().Split("."c)(0), browserVersion)
        End Using

        Dim mode As UInt32 = 11000
        ' Internet Explorer 11. Webpages containing standards-based !DOCTYPE directives are displayed in IE11 Standards mode. Default value for Internet Explorer 11.
        Select Case browserVersion
            Case 7
                mode = 7000
                ' Webpages containing standards-based !DOCTYPE directives are displayed in IE7 Standards mode. Default value for applications hosting the WebBrowser Control.
                Exit Select
            Case 8
                mode = 8000
                ' Webpages containing standards-based !DOCTYPE directives are displayed in IE8 mode. Default value for Internet Explorer 8
                Exit Select
            Case 9
                mode = 9000
                ' Internet Explorer 9. Webpages containing standards-based !DOCTYPE directives are displayed in IE9 mode. Default value for Internet Explorer 9.
                Exit Select
            Case 10
                mode = 10000
                ' Internet Explorer 10. Webpages containing standards-based !DOCTYPE directives are displayed in IE10 mode. Default value for Internet Explorer 10.
                Exit Select
            Case Else
                ' use IE11 mode by default
                Exit Select
        End Select

        Return mode
    End Function
End Class
