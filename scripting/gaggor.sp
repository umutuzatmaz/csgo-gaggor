#include <sourcemod>
#include <sdktools>
#include <colorvariables>
#include <basecomm>

#define plugintag "Sunucu"

bool cookie[MAXPLAYERS + 1] = false;

public Plugin myinfo = 
{
	name = "[CSGO] GagGor",
	author = "Henny!",
	description = "Plugin to show messages from silent players",
	version = "1.0.0"
};

public void OnPluginStart()
{
	RegAdminCmd("sm_gaggor", gaggorSettings, ADMFLAG_GENERIC);
	
	AddCommandListener(OnSayPlayer, "say");
	AddCommandListener(OnSayPlayer, "say_team");
	
	LoadTranslations("henny_plugin_text.phrases");
}

public void OnClientPutInServer(int client)
{
	if (CheckCommandAccess(client, "sm_gaggor", ADMFLAG_GENERIC, false))
	{
		cookie[client] = true;
	}
}

public Action gaggorSettings(int client, int args)
{
	if (cookie[client])
	{
		CPrintToChat(client, "{darkred}[%s] {default}%t", plugintag, "gaggorCookieOff");
		cookie[client] = false;
	}
	else if (!cookie[client])
	{
		CPrintToChat(client, "{darkred}[%s] {default}%t", plugintag, "gaggorCookieOn");
		cookie[client] = true;
	}
}

public Action OnSayPlayer(int client, const char[] command, int args)
{
	for (int i = 1; i <= MaxClients; i++)
	{
		if (cookie[i])
		{
			if (IsClientInGame(client) && client)
			{
				if (BaseComm_IsClientGagged(client))
				{
					char text[256];
					GetCmdArgString(text, sizeof(text));
					char name[64];
					GetClientName(client, name, sizeof(name));
					
					CPrintToChat(i, "{gold}[Gag'lı Oyuncu] {orchid}%s: {red}%s", plugintag, name, text);
				}
			}
		}
	}
}