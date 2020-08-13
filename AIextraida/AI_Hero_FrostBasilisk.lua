-- AI_Basilisk.lua

ActionList =
{

    -- ���
    {
        ID      = "WAIT",
        Motion  = "Basilisk_Wait.frm",
        Func    = "Basiliskf_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 55,
                AIFunc              = "Basiliskf_Check_Targeting",
                DelayFrame          = 110,
            },
            -- �巡��극��01
            {
                AICheckFrame        = 55,
                AIFunc              = "Basiliskf_Check_Attack01",
                DelayFrame          = 110,
            },
            -- �巡��극��02(�밢�� �Ʒ�)
            {
                AICheckFrame        = 55,
                AIFunc              = "Basiliskf_Check_Attack02",
                DelayFrame          = 110,
            },
			-- �巡��극��03
            {
                AICheckFrame        = 55,
                AIFunc              = "Basiliskf_Check_Attack03",
                DelayFrame          = 110,

			},
			-- �巡��극��(���η�)
            {
                AICheckFrame        = 55,
                AIFunc              = "Basiliskf_Check_Attack05",
                DelayFrame          = 110,
			},
            -- ��������
            {
                AICheckFrame        = 220,
                AIFunc              = "Basiliskf_Check_Attack03",
                DelayFrame          = 330,
            },
            -- ��Ű��
            {
                AICheckFrame        = 55,
                AIFunc              = "Basiliskf_Check_Attack04",
                DelayFrame          = 55,
            },
            
            -- �о�� ��ǳ
            {
                AICheckFrame        = 35,
                AIFunc              = "Basiliskf_Check_Attack06",
                DelayFrame          = 35,
            },
			
        },
    },
    
    -- �巡��극��01
    {
        ID      = "ATTACK01",
        Motion  = "Basilisk_Attack01.frm",
        Func    = "Basiliskf_Attack01Func",
    },
    
    -- �巡��극��02
    {
        ID      = "ATTACK02",
        Motion  = "Basilisk_Attack02.frm",
        Func    = "Basiliskf_Attack02Func",
    },
    
    -- �����ũ
    {
        ID      = "ATTACK03",
        Motion  = "Basilisk_Attack03.frm",
        Func    = "Basiliskf_Attack03Func",
    },
    
    -- ��Ű��
    {
        ID      = "ATTACK04",
        Motion  = "Basilisk_Attack04.frm",
        Func    = "Basiliskf_Attack04Func",
    },
    
    -- �巡��극��03 (���η� �Ѹ���)
    {
        ID      = "ATTACK05",
        Motion  = "Basilisk_Attack05.frm",
        Func    = "Basiliskf_Attack05Func",
    },
    
    -- �о�� ��ǳ
	{
		ID      = "ATTACK06",
		Motion  = "basilisk_hero_attack01.frm",
		Func    = "Basiliskf_Attack06Func",
	},
	
    -- ������
    {
        ID      = "DAMAGE",
        Motion  = "Basilisk_Damage.frm",
        Func    = "Basiliskf_DamageFunc",
    },
    
    -- �ٿ�
    {
        ID      = "DOWN",
        Motion  = "Basilisk_Down.frm",
        Func    = "Basiliskf_DownFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 220,
				AICheckFrame1       = 170,
				AICheckFrame2       = 170,
                AIFunc              = "Basiliskf_CheckStandup",
                DelayFrame          = 1,
            },
        }
    },
    
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "Basilisk_Die.frm",
        Func    = "Basiliskf_DieFunc",
    },
    
    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "Basilisk_StandUp.frm",
        Func    = "Basiliskf_StandUpFunc",
    },
}

CallBack =
{
    Land    = "",
    Die     = "OnBasilisk_Die",
    Damage  = "OnBasiliskf_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------
BasiliskDown = {};
function InitFrostBasilisk( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    	
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "DAMAGE" )
    
    pMonster:SetIsRight( false )
    pMonster:SetFly( true )
    pMonster:SetX( 0.2 )
    pMonster:SetY( 1.8 )
    pMonster:SetCountValue( 2 )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Basiliskf_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetX( 0.2 )
		pMonster:SetY( 1.8 )
		pMonster:SetNoCheckContact( 550 )	
		pMonster:PlaySound( 153 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

--  �巡��극��01 ����
function Basiliskf_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:PlaySound( 154 )
	elseif( iFrame == 65 or iFrame == 70 ) then
		pMonster:AddDamageWithLocate( DT_HERO_MONSTER_BASILISK01_01, -0.9, -0.0 )
		pMonster:AddDamageWithLocate( DT_HERO_MONSTER_BASILISK01_02, -0.9, -0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �巡��극��02 ����
function Basiliskf_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:PlaySound( 154 )
    elseif( iFrame >= 55 and iFrame < 81 ) then
		if( math.mod( iFrame, 4 ) == 0 ) then
			pMonster:AddDamageWithLocate( DT_HERO_MONSTER_BASILISK02_01, -0.78, -0.03 )
			pMonster:AddDamageWithLocate( DT_HERO_MONSTER_BASILISK02_02, -0.78, -0.03 )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �����ũ
function Basiliskf_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
		pMonster:StartText( "JUMP" )
        pMonster:PlaySound( 155 )
    elseif( iFrame == 56 ) then
		local posx = -0.6
		local posy = -0.5
		pMonster:AddParticle("Power_Shovel_Arm_01", posx, posy)
		pMonster:AddParticle("Power_Shovel_Arm_02", posx, posy)
		pMonster:AddParticle("Power_Shovel_Arm_03", posx, posy)
		pMonster:EarthQuake( 30, 0.06, 0.03 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ������
function Basiliskf_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:PlaySound( 155 )
    elseif( iFrame == 2 ) then
		pMonster:PlaySound(987026)
    elseif( iFrame == 43 ) then
		pMonster:AddDamageWithLocate( DT_MONSTER_BASILISK04, -0.3, -0.4 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �巡��극��03 ����
function Basiliskf_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:PlaySound( 154 )
    elseif( iFrame >= 81 and iFrame < 101 ) then
		if( math.mod( iFrame, 4 ) == 0 ) then
			pMonster:AddDamageWithLocate( DT_HERO_MONSTER_BASILISK03_01, -0.80, -0.32 )
			pMonster:AddDamageWithLocate( DT_HERO_MONSTER_BASILISK03_02, -0.80, -0.42 )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


--  �巡��극��03 ����
function Basiliskf_Attack06Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:PlaySound( 155 )
    elseif( iFrame == 30 ) then
		pMonster:AddDamageWithLocateDirect(DT_HERO_BASILISK_PUSHPUSHBABY, 0.0, 0.0, true )
		local posx = 0.5
		local posy = -0.52
		pMonster:AddParticleNoDirection("FrostBasil_Windy_01", posx, posy )
		pMonster:AddParticleNoDirection("FrostBasil_Windy_02", posx, posy )
		pMonster:AddParticleNoDirection("FrostBasil_Windy_03", posx, posy )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ����������
function Basiliskf_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ����
function Basiliskf_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        	pMonster:SetFrameLock( true )
    	end
end

-- �ױ����
function Basiliskf_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:PlaySound( 156 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- �Ͼ�����
function Basiliskf_StandUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "ATTACK05" )
    end
end


-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function Basiliskf_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( -300, -1000, 600, 2000, -600 ) == true ) then
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
        pMonster:ResetDelay()
    end
end

function Basiliskf_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( -100, -1200, 800, 1200, -800 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Basiliskf_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( -300, -300, 0, 300, -600 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function Basiliskf_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function Basiliskf_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( -200, -250, -350, 250, -500 ) == true or pMonster:CheckTargetInRange( -150, -150, -100, 150, -350 ) == true ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
    end
end

function Basiliskf_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
    end
end
function Basiliskf_Check_Attack06( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( -200, -250, -350, 250, -500 ) == true or pMonster:CheckTargetInRange( -150, -150, -100, 150, -350 ) == true ) then
		pMonster:SetState( "ATTACK06" )
		pMonster:ResetDelay()
    end
end

function Basiliskf_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetState( "STANDUP" )
    pMonster:SetCountValue( pMonster:GetCountValue() - 1 )
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnBasiliskf_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckState( "DOWN" ) == false ) then
		pMonster:SetState( "DIE" )
	else
		pMonster:SetState( "DIE" )
	end	
end

function OnBasiliskf_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetIsRight( false )
	pMonster:SetNoCheckContact( 550 )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	
	if( ( pMonster:GetCountValue() == 2) and ( pMonster:GetHP() < 0.7*pMonster:GetMaxHP() ) ) then
		pMonster:SetDownDelay( 360 )
		pMonster:SetState( "DOWN" )
	elseif( ( pMonster:GetCountValue() == 1) and ( pMonster:GetHP() < 0.4*pMonster:GetMaxHP() ) ) then
		pMonster:SetDownDelay( 360 )
		pMonster:SetState( "DOWN" )
	end
	
	if( pMonster:CheckState( "DOWN" ) == false ) then
		if( pMonster:FloatRand() < 0.04 ) then    
			pMonster:SetState( "ATTACK06" )	
            pMonster:SetSuperArmor(true)
        elseif( pMonster:FloatRand() < 0.04 ) then    
            pMonster:SetState( "ATTACK03" )	
            pMonster:SetSuperArmor(true)
		end
	end
end
