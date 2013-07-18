using UnityEditor;

class Builder
{
	static void DoBuild()
	{
		string[] levels = { "Assets/scene.unity" };
		string outpath = "/tmp/unity_ios";
		string res = BuildPipeline.BuildPlayer(levels, outpath, BuildTarget.iPhone, BuildOptions.None);
		if (res.Length > 0)
			throw new System.Exception("BuildPlayer failure: " + res);
	}
}
