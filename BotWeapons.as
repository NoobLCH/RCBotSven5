
CBotWeaponsInfo@ g_WeaponInfo = CBotWeaponsInfo();

const int WEAP_FL_NONE = 0;
const int WEAP_FL_MELEE = 1;
const int WEAP_FL_UNDERWATER = 2;
const int WEAP_FL_SECONDARY = 4;
const int WEAP_FL_PRIMARY_EXPLOSIVE = 8;
const int WEAP_FL_SECONDARY_EXPLOSIVE = 16;
const int WEAP_FL_GRENADE = 32;
const int WEAP_FL_SNIPE = 64;
const int WEAP_FL_RPG = 128;

final class CBotWeaponInfo
{
    string m_szName;

    float m_fMinDistance;
    float m_fMaxDistance;

    float m_fMinDistance_Secondary;
    float m_fMaxDistance_Secondary;

    // from 0 to 1 , if 1, bot will hold fire
    float m_fFirePercent;

    int m_iPriority;

    int m_iFlags;

    bool hasFlags ( int flags )
    {
        return m_iFlags & flags == flags;
    }

    bool shouldFire ()
    {
        return Math.RandomFloat(0.0,1.0f) <= m_fFirePercent;
    }

    CBotWeaponInfo ( float fFirePercent, string name, float min_dist, float max_dist, int flags, int priority, float secondary_min_dist = 0, float secondary_max_dist = 0 )
    {
        m_szName = name;
        m_fMinDistance = min_dist;
        m_fMaxDistance = max_dist;
        m_iPriority = priority;
        m_iFlags = flags;
        m_fMinDistance_Secondary = secondary_min_dist;
        m_fMaxDistance_Secondary = secondary_max_dist;

        m_fFirePercent = fFirePercent;
    }
}

final class CBotWeaponsInfo
{
    array<CBotWeaponInfo@> m_pWeaponInfo;

    CBotWeaponsInfo ()
    {
        //CBotWeaponInfo ( float fFirePercent, string name, float min_dist, float max_dist, int flags, int priority, float secondary_min_dist = 0, float secondary_max_dist = 0 )
    
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.9,"weapon_gauss",0.0,2000.0,WEAP_FL_PRIMARY_EXPLOSIVE,100));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_crowbar",0.0,100.0,WEAP_FL_MELEE|WEAP_FL_UNDERWATER,1));        
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.9,"weapon_9mmhandgun",0.0,1500.0,WEAP_FL_UNDERWATER|WEAP_FL_SECONDARY,1,0.0,1500.0));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.9,"weapon_shotgun",0.0,768.0,WEAP_FL_NONE|WEAP_FL_SECONDARY,8,0.0,200.0));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.9,"weapon_hl357",0.0,2000.0,WEAP_FL_NONE,7));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.9,"weapon_ofeagle",0.0,2000.0,WEAP_FL_NONE,6));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_9mmAR",0.0,2000.0,WEAP_FL_NONE,9));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.9,"weapon_crossbow",0.0,4000.0,WEAP_FL_SNIPE|WEAP_FL_UNDERWATER,2));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_egon",100.0,2000.0,WEAP_FL_PRIMARY_EXPLOSIVE,12));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.9,"weapon_hornetgun",0.0,2000.0,WEAP_FL_UNDERWATER,6));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_asm16",0.0,2000.0,WEAP_FL_SECONDARY_EXPLOSIVE,13,200,1300));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_pipewrench",0.0,100.0,WEAP_FL_MELEE|WEAP_FL_UNDERWATER,2));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.8,"weapon_rpg",512.0,5000.0,WEAP_FL_RPG|WEAP_FL_PRIMARY_EXPLOSIVE|WEAP_FL_UNDERWATER,16));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.9,"weapon_shockrifle",100.0,2000.0,WEAP_FL_NONE,9));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.9,"weapon_snark",300.0,2000.0,WEAP_FL_GRENADE|WEAP_FL_UNDERWATER,10));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_uzi",100.0,2000.0,WEAP_FL_NONE,10));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_medkit",0.0,0.0,WEAP_FL_NONE,0)); // will be handled in task code
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_grapple",0.0,0.0,WEAP_FL_NONE,0)); // will be handled in task code
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.8,"weapon_handgrenade",256.0,512.0,WEAP_FL_GRENADE|WEAP_FL_PRIMARY_EXPLOSIVE|WEAP_FL_UNDERWATER|WEAP_FL_PRIMARY_EXPLOSIVE,15)); // will be handled in task code
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.6,"weapon_sniperrifle",512.0,8000.0,WEAP_FL_SNIPE,10)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_m249",60.0,2400.0,WEAP_FL_NONE,11)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_minigun",0.0,3000.0,WEAP_FL_NONE,16)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.9,"weapon_sporelauncher",64.0,1024.0,WEAP_FL_GRENADE|WEAP_FL_NONE,12)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.9,"weapon_displacer",64.0,3000.0,WEAP_FL_UNDERWATER,15)); 
        // They hunger weapons
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.9,"weapon_colt1911",64.0,1500.0,WEAP_FL_UNDERWATER,1,0.0,1500.0));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.9,"weapon_sawedoff",64.0,768.0,WEAP_FL_NONE,8));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.9,"weapon_tommygun",64.0,2000.0,WEAP_FL_NONE,13,200,1300));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.9,"weapon_m14",64.0,2500.0,WEAP_FL_NONE,2));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.9,"weapon_m16a1",64.0,2000.0,WEAP_FL_NONE|WEAP_FL_SECONDARY,13,200,800));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_spanner",0.0,100.0,WEAP_FL_MELEE|WEAP_FL_UNDERWATER,2));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.9,"weapon_greasegun",0.0,2000.0,WEAP_FL_NONE,9));
        // Ins2 weapons
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2garand",0.0,3000.0,WEAP_FL_UNDERWATER,14)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2m1a1para",0.0,3000.0,WEAP_FL_UNDERWATER,13)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_ins2m1928",0.0,3000.0,WEAP_FL_UNDERWATER,13)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2m1911",0.0,3000.0,WEAP_FL_UNDERWATER,9)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2webley",0.0,3000.0,WEAP_FL_UNDERWATER,9)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2kabar",0.0,100.0,WEAP_FL_MELEE|WEAP_FL_UNDERWATER,1)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2knuckles",0.0,100.0,WEAP_FL_MELEE|WEAP_FL_UNDERWATER,1)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2mk2",200.0,500.0,WEAP_FL_GRENADE|WEAP_FL_PRIMARY_EXPLOSIVE|WEAP_FL_UNDERWATER|WEAP_FL_PRIMARY_EXPLOSIVE,15)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2at4",0.0,3000.0,WEAP_FL_RPG|WEAP_FL_PRIMARY_EXPLOSIVE|WEAP_FL_UNDERWATER,16)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2pzfaust",0.0,3000.0,WEAP_FL_RPG|WEAP_FL_PRIMARY_EXPLOSIVE|WEAP_FL_UNDERWATER,16)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2enfield",0.0,3000.0,WEAP_FL_UNDERWATER,13)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2beretta",0.0,3000.0,WEAP_FL_UNDERWATER,9)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2glock17",0.0,3000.0,WEAP_FL_UNDERWATER,9)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2g43",0.0,3000.0,WEAP_FL_UNDERWATER,14)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_ins2mp18",0.0,3000.0,WEAP_FL_UNDERWATER,13)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_ins2mp40",0.0,3000.0,WEAP_FL_UNDERWATER,13)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_ins2mp5k",0.0,3000.0,WEAP_FL_UNDERWATER,13)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_ins2ump45",0.0,3000.0,WEAP_FL_UNDERWATER,13)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2m590",0.0,3000.0,WEAP_FL_UNDERWATER,13)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2m1014",0.0,3000.0,WEAP_FL_UNDERWATER,14)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2coach",0.0,3000.0,WEAP_FL_UNDERWATER,13)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2ithaca",0.0,3000.0,WEAP_FL_UNDERWATER,13)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2pzschreck",0.0,3000.0,WEAP_FL_RPG|WEAP_FL_PRIMARY_EXPLOSIVE|WEAP_FL_UNDERWATER,16)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2rpg7",0.0,3000.0,WEAP_FL_RPG|WEAP_FL_PRIMARY_EXPLOSIVE|WEAP_FL_UNDERWATER,16)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2law",0.0,3000.0,WEAP_FL_RPG|WEAP_FL_PRIMARY_EXPLOSIVE|WEAP_FL_UNDERWATER,16)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_ins2rpk",0.0,3000.0,WEAP_FL_UNDERWATER,14)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_ins2m249",0.0,3000.0,WEAP_FL_UNDERWATER,14)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_ins2m60",0.0,3000.0,WEAP_FL_UNDERWATER,14)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2kukri",0.0,3000.0,WEAP_FL_MELEE|WEAP_FL_UNDERWATER,1)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_ins2ak74",0.0,3000.0,WEAP_FL_UNDERWATER,14)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_ins2sks",0.0,3000.0,WEAP_FL_UNDERWATER,14)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_ins2m4a1",0.0,3000.0,WEAP_FL_UNDERWATER,14)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_ins2m16a4",0.0,3000.0,WEAP_FL_UNDERWATER,14)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_ins2l85a2",0.0,3000.0,WEAP_FL_UNDERWATER,14)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_ins2akm",0.0,3000.0,WEAP_FL_UNDERWATER,14)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2stick",200.0,500.0,WEAP_FL_GRENADE|WEAP_FL_PRIMARY_EXPLOSIVE|WEAP_FL_UNDERWATER|WEAP_FL_PRIMARY_EXPLOSIVE,15)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2makarov",0.0,3000.0,WEAP_FL_UNDERWATER,9)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2saiga12",0.0,3000.0,WEAP_FL_UNDERWATER,14)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2fnfal",0.0,3000.0,WEAP_FL_UNDERWATER,14)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2g3a3",0.0,3000.0,WEAP_FL_UNDERWATER,14)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2c96",0.0,3000.0,WEAP_FL_UNDERWATER,9)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_ins2aks74u",0.0,3000.0,WEAP_FL_UNDERWATER,14)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_ins2c96carb",0.0,3000.0,WEAP_FL_UNDERWATER,13)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2deagle",0.0,3000.0,WEAP_FL_UNDERWATER,13)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_ins2mp7",0.0,3000.0,WEAP_FL_UNDERWATER,13)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_ins2ak12",0.0,3000.0,WEAP_FL_UNDERWATER,14)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_ins2asval",0.0,3000.0,WEAP_FL_UNDERWATER,14)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_ins2galil",0.0,3000.0,WEAP_FL_UNDERWATER,14)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2m14ebr",0.0,3000.0,WEAP_FL_UNDERWATER,14)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_ins2mg42",0.0,3000.0,WEAP_FL_UNDERWATER,14)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2usp",0.0,3000.0,WEAP_FL_UNDERWATER,9)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_ins2m2",0.0,3000.0,WEAP_FL_RPG|WEAP_FL_PRIMARY_EXPLOSIVE|WEAP_FL_UNDERWATER,16)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_ins2l2a3",0.0,3000.0,WEAP_FL_UNDERWATER,13)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_ins2stg44",0.0,3000.0,WEAP_FL_UNDERWATER,14)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_ins2fg42",0.0,3000.0,WEAP_FL_UNDERWATER,14)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_ins2lewis",0.0,3000.0,WEAP_FL_UNDERWATER,14)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_ins2kar98k",0.0,3000.0,WEAP_FL_UNDERWATER,13));  
        // BDSC weapons
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.9,"weapon_bd_glock",0.0,1500.0,WEAP_FL_UNDERWATER|WEAP_FL_SECONDARY,1,0.0,1500.0));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.9,"weapon_bd_shotgun",0.0,768.0,WEAP_FL_NONE,8));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.9,"weapon_bd_357",0.0,2000.0,WEAP_FL_NONE,7));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.9,"weapon_bd_eagle",0.0,2000.0,WEAP_FL_NONE,6));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_bd_mp5",0.0,2000.0,WEAP_FL_NONE,9));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_bd_asm16",0.0,2000.0,WEAP_FL_SECONDARY_EXPLOSIVE,13,200,1300));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.9,"weapon_bd_hlshockrifle",100.0,2000.0,WEAP_FL_NONE,9));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.6,"weapon_bd_sniperrifle",512.0,8000.0,WEAP_FL_SNIPE,10)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_bd_m249",60.0,2400.0,WEAP_FL_NONE,11)); 
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_bd_asminigun",0.0,3000.0,WEAP_FL_NONE,16)); 
        // AoM/AoMDC weapons
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_dcknife",0.0,100.0,WEAP_FL_MELEE|WEAP_FL_UNDERWATER,2));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.7,"weapon_dcp228",0.0,1500.0,WEAP_FL_NONE,9));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_clknife",0.0,100.0,WEAP_FL_MELEE|WEAP_FL_UNDERWATER,2));
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.7,"weapon_clberetta",0.0,1500.0,WEAP_FL_NONE,9));
        // Other weapons
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_knife",0.0,100.0,WEAP_FL_MELEE|WEAP_FL_UNDERWATER,2)); //op4
        m_pWeaponInfo.insertLast(CBotWeaponInfo(0.5,"weapon_csglock18",0.0,3000.0,WEAP_FL_UNDERWATER,9)); //cs16
        m_pWeaponInfo.insertLast(CBotWeaponInfo(1.0,"weapon_mp5sil",0.0,2000.0,WEAP_FL_NONE,9)); //opbt
    }

    int numWeapons ()
    {
        return m_pWeaponInfo.length();        
    }

    CBotWeaponInfo@ getWeapon ( int i )
    {
        return m_pWeaponInfo[i];
    }
}

class CBotWeapon 
{
    CBotWeapon ( CBotWeaponInfo@ info )
    {
        @m_pWeaponInfo = info;
        m_pWeaponEntity = null;
    }

    bool shouldFire ()
    {
        return m_pWeaponInfo.shouldFire();
    }

    bool isOtherBetterChoiceThan ( CBotWeapon@ other )
    {
        return other.m_pWeaponInfo.m_iPriority > m_pWeaponInfo.m_iPriority;
    }

    CBasePlayerWeapon@ getWeaponPtr ()
    {
         return cast<CBasePlayerWeapon@>(m_pWeaponEntity.GetEntity());
    }

    bool IsMelee()
    {
        return m_pWeaponInfo.m_iFlags & WEAP_FL_MELEE == WEAP_FL_MELEE;
    }

    bool IsZoomed ()
    {
        CBasePlayerWeapon@ weap = getWeaponPtr();

        return weap !is null && weap.m_fInZoom;
    }

    bool IsSniperRifle ()
    {
        return m_pWeaponInfo.m_iFlags & WEAP_FL_SNIPE == WEAP_FL_SNIPE;
    }

    bool IsRPG ()
    {
        return m_pWeaponInfo.m_iFlags & WEAP_FL_RPG == WEAP_FL_RPG;
    }

    string GetClassname ()
    {
        return m_pWeaponInfo.m_szName;
    }

    void setWeaponEntity ( CBasePlayerWeapon@ pWeapon )
    {
        m_pWeaponEntity = pWeapon;
    }

    bool HasWeapon ()
    {
        return m_pWeaponEntity.GetEntity() !is null;
    }

    bool IsMinigun ()
    {
        return m_pWeaponInfo.m_szName == "weapon_minigun" || m_pWeaponInfo.m_szName == "weapon_bd_asminigun";
    }

    bool CanUseUnderwater ()
    {
        return m_pWeaponInfo.hasFlags(WEAP_FL_UNDERWATER) ;
    }

    bool outOfAmmo (CBasePlayer@ player)
    {
        CBasePlayerWeapon@ weap  = cast<CBasePlayerWeapon@>(m_pWeaponEntity.GetEntity());

        int index = weap.PrimaryAmmoIndex();

        return (index >= 0) && ((weap.m_iClip + player.m_rgAmmo(index)) == 0);
    }

    int getMaxPrimaryAmmo ()
    {
        CBasePlayerWeapon@ weap  = cast<CBasePlayerWeapon@>(m_pWeaponEntity.GetEntity());

        return weap.iMaxAmmo1();
    }

    bool withinRange ( float distance )
    {

        return (distance > m_pWeaponInfo.m_fMinDistance) && (distance < m_pWeaponInfo.m_fMaxDistance);
    }

    bool secondaryWithinRange ( float distance )
    {
        return (distance > m_pWeaponInfo.m_fMinDistance_Secondary) && (distance < m_pWeaponInfo.m_fMaxDistance_Secondary);
    }

    int getPrimaryAmmo( RCBot@ bot )
    {
        CBasePlayerWeapon@ weap  = cast<CBasePlayerWeapon@>(m_pWeaponEntity.GetEntity());

        if ( weap is null )
            return 0;
        
        int index = weap.PrimaryAmmoIndex();

        if ( index >= 0 )
            return bot.m_pPlayer.m_rgAmmo(index) + weap.m_iClip;

        return 0;
    }    

    int getSecondaryAmmo( RCBot@ bot )
    {
        CBasePlayerWeapon@ weap  = cast<CBasePlayerWeapon@>(m_pWeaponEntity.GetEntity());
        
        int index = weap.SecondaryAmmoIndex();

        if ( index >= 0 )
            return bot.m_pPlayer.m_rgAmmo(index) + weap.m_iClip2;

        return 0;
    }      

    bool isGrenade ( )
    {
        return m_pWeaponInfo.m_iFlags & WEAP_FL_GRENADE == WEAP_FL_GRENADE;
    }

    bool isExplosive ( RCBot@ bot )
    {
       if ( (m_pWeaponInfo.m_iFlags & (WEAP_FL_PRIMARY_EXPLOSIVE|WEAP_FL_SECONDARY_EXPLOSIVE)) > 0 )
       {
           if ( m_pWeaponInfo.m_iFlags & WEAP_FL_PRIMARY_EXPLOSIVE == WEAP_FL_PRIMARY_EXPLOSIVE )
           {
               if ( getPrimaryAmmo(bot) == 0 )
                    return false;
           }
            
           if ( m_pWeaponInfo.m_iFlags & WEAP_FL_SECONDARY_EXPLOSIVE == WEAP_FL_SECONDARY_EXPLOSIVE )
           {
               if ( getSecondaryAmmo(bot) == 0 )
                    return false;
           }

            return true;
       }

       return false;
    }

    bool CanUseSecondary ()
    {
        return m_pWeaponInfo.m_iFlags & (WEAP_FL_SECONDARY|WEAP_FL_SECONDARY_EXPLOSIVE) > 0;
    }

	bool needToReload (RCBot@ bot)
	{
        CBasePlayerWeapon@ weap  = cast<CBasePlayerWeapon@>(m_pWeaponEntity.GetEntity());

        bool ret = weap !is null && weap.m_iClip == 0 && !outOfAmmo(bot.m_pPlayer);

        if (ret )
        {
            UTIL_DebugMsg(bot.m_pPlayer,"needToReload() == true, clip = " + weap.m_iClip,DEBUG_THINK);
            return true;
        }

        return false;
	}    

    string GetName ()
    {
        return m_pWeaponInfo.m_szName;
    }

    CBotWeaponInfo@ m_pWeaponInfo;
    EHandle m_pWeaponEntity;

}

class CBotWeapons
{
    array<CBotWeapon@> m_pWeapons;
    CBotWeapon@ m_pCurrentWeapon;

    CBotWeapons ()
    {
        for ( int i = 0; i < g_WeaponInfo.numWeapons(); i ++ )
        {
            CBotWeaponInfo@ weapon = g_WeaponInfo.getWeapon(i);

            m_pWeapons.insertLast(CBotWeapon(weapon));                        
        }

        @m_pCurrentWeapon = null;
    }

    bool HasExplosives ( RCBot@ bot )
    {
        for ( uint i = 0; i < m_pWeapons.length(); i ++ )
        {
            CBotWeapon@ weapon = m_pWeapons[i];
            float distance;

            if ( weapon.HasWeapon() == true )
            {                
                if ( weapon.isExplosive(bot) )
                    return true;
            }
        }

        return false;
    }

    CBotWeapon@ findBotWeapon ( CBasePlayerWeapon@ weapon )
    {
        for ( uint i = 0; i < m_pWeapons.length(); i ++ )
        {
            CBotWeapon@ botweapon = m_pWeapons[i];

            if ( botweapon.m_pWeaponEntity.GetEntity() is weapon )
                return botweapon;                
        }

        return null;     
    }

    CBotWeapon@ findBotWeapon ( string name )
    {

        for ( uint i = 0; i < m_pWeapons.length(); i ++ )
        {        
            CBotWeapon@ weapon = null;
        
            @weapon = m_pWeapons[i];

            if ( weapon.GetClassname() == name )
            {
                return weapon;
            }
        }   

        return null;

    }
    
    CBotWeapon@ getCurrentWeapon ( ) 
    {        
        return m_pCurrentWeapon;
    }


    private CBotWeapon@ findCurrentWeapon ( RCBot@ bot ) 
    {        
        CBasePlayerWeapon@ activeWeapon = cast<CBasePlayerWeapon@>(bot.m_pPlayer.m_hActiveItem.GetEntity());

        return findBotWeapon(activeWeapon);
    }

    void selectWeapon ( RCBot@ bot, CBotWeapon@ pWeapon )
    {
        bot.m_pPlayer.SelectItem(pWeapon.GetClassname());
        @m_pCurrentWeapon = pWeapon;        
       // BotMessage("SELECT " + pWeapon.GetClassname());        
    }    

    void updateWeapons ( RCBot@ bot )
    {
        for ( uint i = 0; i < m_pWeapons.length(); i ++ )
        {
            CBotWeapon@ weapon = m_pWeapons[i];
            CBasePlayerItem@ item = bot.m_pPlayer.HasNamedPlayerItem(weapon.GetClassname()); 
            CBasePlayerWeapon@ pWeaponEntity = null;

            if ( item !is null )
            {
                @pWeaponEntity =  item.GetWeaponPtr();                    
            }

            weapon.setWeaponEntity(pWeaponEntity);         
        }

         @m_pCurrentWeapon = findCurrentWeapon(bot);

    }

    float getNumWeaponsPercent ( RCBot@ bot )
    {
        int iTotalWeapons = m_pWeapons.length();
        int iHasWeapons = 0;
        CBotWeapon@ weapon = null;
        
        for ( uint i = 0; i < m_pWeapons.length(); i ++ )
        {
            @weapon = m_pWeapons[i];

            if ( weapon.HasWeapon() )
            {
                iHasWeapons++;
            }
        }   

        if ( iTotalWeapons > 0 )
            return float(iHasWeapons)/iTotalWeapons;

        return 0;
    }


    float getPrimaryAmmoPercent ( RCBot@ pBot )
    {
        CBasePlayer@ botPlayer = pBot.m_pPlayer;
        int iTotalAmmo = 0;
        int iTotalMaxAmmo = 0;
        CBotWeapon@ weapon;

        for ( uint i = 0; i < m_pWeapons.length(); i ++ )
        {
            @weapon = m_pWeapons[i];

            if ( weapon.HasWeapon() )
            {
                iTotalAmmo += weapon.getPrimaryAmmo(pBot);
                iTotalMaxAmmo += weapon.getMaxPrimaryAmmo();
            }
        }

        if ( iTotalMaxAmmo > 0 ) 
            return float(iTotalAmmo) / iTotalMaxAmmo;

        return 0;
    }

    CBotWeapon@ findBestWeapon ( RCBot@ pBot, Vector targetOrigin, CBaseEntity@ target = null )
    {
        CBotWeapon@ weaponOfChoice = null;
        CBasePlayer@ botPlayer = pBot.m_pPlayer;

        bool bExplosivesOnly = false;

        if ( target !is null )
        {
            string classname = target.GetClassname();

            if ( classname == "monster_gargantua" )
                bExplosivesOnly = true;
            if ( classname == "func_breakable" )
                bExplosivesOnly = (target.pev.spawnflags & 512) == 512;
        }

        for ( uint i = 0; i < m_pWeapons.length(); i ++ )
        {
            CBotWeapon@ weapon = m_pWeapons[i];
            float distance;

            if ( weapon.HasWeapon() == false )
            {
            //    BotMessage("I don't have " + weapon.GetName());
                continue;
            }

            if ( bExplosivesOnly )
            {
                if ( !weapon.isExplosive(pBot) )
                    continue;
            }

            if ( weapon.isGrenade() )
            {
                if ( target !is null )
                {
                    if ( (target.pev.flags & FL_ONGROUND) != FL_ONGROUND )
                    {                        
                        continue;
                    }

                    Vector vTarget = UTIL_EntityOrigin(target);

                    if ( vTarget.z > pBot.m_pPlayer.pev.origin.z )
                        continue;
                }
            }

            // out of ammo
            if ( weapon.outOfAmmo(botPlayer) )
            {
                UTIL_DebugMsg(botPlayer,weapon.GetName() + " Out of ammo",DEBUG_THINK);
                continue;
            }

            if ( botPlayer.pev.waterlevel > 2 && !weapon.CanUseUnderwater() )
                continue;
 
            if ( target !is null )
                distance = pBot.distanceFrom(target);
            else 
                distance = pBot.distanceFrom(targetOrigin);

            if ( !weapon.withinRange(distance) )
                continue;                

            if ( weaponOfChoice is null || weaponOfChoice.isOtherBetterChoiceThan(weapon) )
            {
                @weaponOfChoice = weapon;
            }
        }

        return weaponOfChoice;
    }

    void DoWeapons ( RCBot@ bot, CBaseEntity@ pEnemy )
    {
        if ( pEnemy !is null )
        {
            CBotWeapon@ desiredWeapon = findBestWeapon(bot,UTIL_EntityOrigin(pEnemy),pEnemy);
        
            if ( desiredWeapon !is null )
            {                
	            //BotMessage("ENEMY = " + pEnemy.GetClassname() + " BEST WEAPON = " + desiredWeapon.GetName() );

                if ( desiredWeapon !is m_pCurrentWeapon )
                {
                    if ( m_pCurrentWeapon !is null && m_pCurrentWeapon.IsMinigun() && !desiredWeapon.IsMinigun() )
                    {
                        // drop the weapon 
                        bot.m_pPlayer.DropItem(m_pCurrentWeapon.GetName());
                    }
                    else
                        selectWeapon(bot,desiredWeapon);
                }
            }
        }
    }

    void spawnInit ()
    {
         @m_pCurrentWeapon = null;
    }
}
