        public async void SetTeardownText(string text)
        {
            text = text.Replace(" ", "-");
            string newcontent = "<prefab version=\"0.5.4\">\r\n\t<location tags='text=" + text + "'/>\r\n</prefab>";
            string docPath = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments);
            string path = Path.Combine(docPath, "Teardown\\mods\\_savegamexml\\prefab\\test.xml");
            FileStream docStream = new FileStream(path, FileMode.Open, FileAccess.ReadWrite, FileShare.ReadWrite);
            await docStream.DisposeAsync();
            docStream.Close();
            File.WriteAllText(path, newcontent);
        }
