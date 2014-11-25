﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace DisplayMonkey
{
	public class Frame
	{
		public int FrameId = 0;
		public int PanelId = 0;
		public int Duration = 0;
		public string FrameType = null;
		public string URL = null;

		public static string GetFrameType(int frameId)
		{
			string type = "";
			string sql = string.Format("SELECT top 1 FrameType from Frame_Type_View WHERE FrameId={0}", frameId);
			using (DataSet ds = DataAccess.RunSql(sql))
			{
				if (ds.Tables[0].Rows.Count > 0)
				{
					type = DataAccess.StringOrBlank(ds.Tables[0].Rows[0][0]);
				}
			}
			return type;
		}

		public static int GetPanelId(int frameId)
		{
			int panelId = 0;
			string sql = string.Format("SELECT top 1 PanelId from Frame WHERE FrameId={0}", frameId);
			using (DataSet ds = DataAccess.RunSql(sql))
			{
				if (ds.Tables[0].Rows.Count > 0)
				{
					panelId = DataAccess.IntOrZero(ds.Tables[0].Rows[0][0]);
				}
			}
			return panelId;
		}

        public static Frame GetNextFrame(int panelId, int displayId, int frameId)
		{
            lock (_lock)
            {
                SqlCommand cmd = Frame.NextFrameCommand;
                cmd.Parameters["@panelId"].Value = panelId;
                cmd.Parameters["@displayId"].Value = displayId;
                cmd.Parameters["@lastFrameId"].Value = frameId;

                DataAccess.ExecuteNonQuery(cmd);

                Frame nci = new Frame()
                {
                    PanelId = panelId
                };

                if (cmd.Parameters["@nextFrameId"].Value != DBNull.Value)
                    nci.FrameId = (int)cmd.Parameters["@nextFrameId"].Value;
                if (cmd.Parameters["@duration"].Value != DBNull.Value)
                    nci.Duration = (int)cmd.Parameters["@duration"].Value;
                if (cmd.Parameters["@frameType"].Value != DBNull.Value)
                    nci.FrameType = (string)cmd.Parameters["@frameType"].Value;

                return nci;
            }
		}

		public virtual string Payload { get { return ""; } }

		#region Protected Members

		protected string _templatePath;

		#endregion

		#region Private Members

		private static SqlCommand NextFrameCommand
		{
			get
			{
				if (_sp_GetNextFrame == null)
				{
					_sp_GetNextFrame = new SqlCommand("sp_GetNextFrame");
					_sp_GetNextFrame.CommandType = CommandType.StoredProcedure;
                    _sp_GetNextFrame.Parameters.Add("@panelId", SqlDbType.Int);
                    _sp_GetNextFrame.Parameters.Add("@displayId", SqlDbType.Int);
                    _sp_GetNextFrame.Parameters.Add("@lastFrameId", SqlDbType.Int);
					_sp_GetNextFrame.Parameters.Add("@nextFrameId", SqlDbType.Int).Direction = ParameterDirection.Output;
					_sp_GetNextFrame.Parameters.Add("@duration", SqlDbType.Int).Direction = ParameterDirection.Output;
					_sp_GetNextFrame.Parameters.Add("@frameType", SqlDbType.VarChar, 20).Direction = ParameterDirection.Output;
				}
				_sp_GetNextFrame.Connection = DataAccess.Connection;
				return _sp_GetNextFrame;
			}
		}

		private static SqlCommand _sp_GetNextFrame = null;
        private static object _lock = new object();

		#endregion
	}
}