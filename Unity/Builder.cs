using UnityEditor;
using System.IO;

class Builder
{
	static void DoBuild()
	{
		string[] levels = { "Assets/scene.unity" };
		string outpath = Path.Combine(Application.dataPath, "../unity_output");
		string res = BuildPipeline.BuildPlayer(levels, outpath, BuildTarget.iPhone, BuildOptions.None);
		if (res.Length > 0)
			throw new System.Exception("BuildPlayer failure: " + res);
	}
}
