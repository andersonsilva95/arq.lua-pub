-- AI_Tytaros.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Tytaros_Wait.frm",
        Func    = "Tytaros_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 25,
                AIFunc              = "Tytaros_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 75,
                AIFunc              = "Tytaros_Check_TurnToTarget",
                DelayFrame          = 75,
            },
            -- �ȱ�
            {
                AICheckFrame        = 75,
                AIFunc              = "Tytaros_Check_Walk",
                DelayFrame          = 110,
            },

            -- �ȱ�����
            {
                AICheckFrame        = 100,
                AIFunc              = "Tytaros_Check_Attack01",
                DelayFrame          = 250,
            },

            -- ��������
            {
                AICheckFrame        = 55,
                AIFunc              = "Tytaros_Check_Attack02",
                DelayFrame          = 80,
            },

            -- �ݰ�
            {
                AICheckFrame        = 150,
                AIFunc              = "Tytaros_Check_Attack03",
                DelayFrame          = 100,
            },
            -- ��������
            {
                AICheckFrame        = 200,
                AIFunc              = "Tytaros_Check_Attack04",
                DelayFrame          = 400,
            },

            -- ������
            {
                AICheckFrame        = 100,
                AIFunc              = "Tytaros_Check_Attack05",
                DelayFrame          = 220,
            },

            -- ��������
			{
				AICheckFrame		= 55,
				AIFunc				= "Tytaros_Check_JumpUp",
				DelayFrame			= 75,
			},
			-- �����ٿ�
			{
				AICheckFrame		= 80,
				AIFunc				= "Tytaros_Check_JumpDown",
				DelayFrame			= 85,
			},
        },
    },

    -- �̵�
    {
        ID      = "WALK",
        Motion  = "Tytaros_Move.frm",
        Func    = "Tytaros_WalkFunc",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 25,
                AIFunc              = "Tytaros_Check_Targeting",
                DelayFrame          = 110,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 55,
                AIFunc              = "Tytaros_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- ��������
			{
				AICheckFrame		= 55,
				AIFunc				= "Tytaros_Check_JumpUp",
				DelayFrame			= 75,
			},
			-- �����ٿ�
			{
				AICheckFrame		= 80,
				AIFunc				= "Tytaros_Check_JumpDown",
				DelayFrame			= 85,
			},
			-- ��������
            {
                AICheckFrame        = 35,
                AIFunc              = "Tytaros_Check_Attack01",
                DelayFrame          = 110,
            },
            -- ���߱�
            {
                AICheckFrame        = 10,
                AIFunc              = "Tytaros_Check_Stop",
                DelayFrame          = 55,
            },
        }
    },
    
    -- �ȱ� ����
    {
        ID      = "ATTACK01",
        Motion  = "Tytaros_Attack01.frm",
        Func    = "Tytaros_Attack01Func",
    },
    
    -- ��������
    {
        ID      = "ATTACK02",
        Motion  = "Tytaros_Attack02.frm",
        Func    = "Tytaros_Attack02Func",
    },
    
    -- �ݰ�
    {
        ID      = "ATTACK03",
        Motion  = "Tytaros_Attack03.frm",
        Func    = "Tytaros_Attack03Func",
    },
        
    -- �߱�����
    {
        ID      = "ATTACK04",
        Motion  = "Tytaros_Attack04.frm",
        Func    = "Tytaros_Attack04Func",
    },
    
    -- ������
    {
        ID      = "ATTACK05",
        Motion  = "Tytaros_Attack05.frm",
        Func    = "Tytaros_Attack05Func",
    },
    
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "Tytaros_Die.frm",
        Func    = "Tytaros_DieFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Tytaros_Damage_Middle.frm",
        Func    = "Tytaros_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Tytaros_Damage_Down.frm",
        Func    = "Tytaros_DamageFunc",
    },
    
    -- �ٿ�
    {
        ID                  = "DOWN",
        Motion              = "Tytaros_Down.frm",
        Func                = "Tytaros_DamageDownFunc",
    },
    
    -- ����
	{
		ID	  = "JUMP",
		Motion  = "Tytaros_Jump.frm",
		Func	= "Tytaros_JumpFuncUp",
	},

	-- �����ٿ�
	{
		ID	  = "JUMPDOWN",
		Motion  = "Tytaros_JumpDown.frm",
		Func	= "Tytaros_JumpFunc",
	},

	-- ����
	{
		ID	  = "LANDING",
		Motion  = "Tytaros_Jump_Landing.frm",
		Func	= "Tytaros_LandingFunc",
	},
}

CallBack =
{
    Land    = "OnTytaros_Land",
    Die     = "OnTytaros_Die",
    Damage  = "OnTytaros_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitTytaros( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DOWN" )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Tytaros_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- �ȱ� ����
function Tytaros_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
    
    if( iFrame == 53 ) then
		pMonster:PlaySound( 998008 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:PlaySound( 998008 )
        pMonster:SetState( "WALK" )
    end
end

-- ���� ����
function Tytaros_JumpFuncUp( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMPDOWN")
		pMonster:SetFrameLock( false )
	end

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
	end
end

-- ���� ����
function Tytaros_JumpFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
	end
end

-- ���� ����
function Tytaros_LandingFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 6 ) then
		pMonster:PlaySound( 998008 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState("WAIT")
	end
end

-- �״»���
function Tytaros_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(998048)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
    end
end

-- ������ ������
function Tytaros_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ������ ������
function Tytaros_DamageDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
        pMonster:SetPushCheck( true )
    end
end

--  �ȱ�����
function Tytaros_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 48 ) then
		pMonster:PlaySound( 998009 )
		pMonster:AddDamage(DT_TYTAROS_EYERAY)
    elseif( iFrame == 51 ) then
		local posx = 0.23
		local posy = 0.43
		
		if( pMonster:GetIsRight() == false ) then
			posx = -0.23
			pMonster:AddParticleNoDirection("Tytaros_Eyebeam_01_R", posx, posy)
			pMonster:AddParticleNoDirection("Tytaros_Eyebeam_02_R", posx, posy)
			pMonster:AddParticleNoDirection("Tytaros_Eyebeam_03",   posx, posy)
			pMonster:AddParticleNoDirection("Tytaros_Eyebeam_04_R", posx, posy)
			pMonster:AddParticleNoDirection("Tytaros_Eyebeam_05_R", posx, posy)
		else
			pMonster:AddParticle("Tytaros_Eyebeam_01", posx, posy)
			pMonster:AddParticle("Tytaros_Eyebeam_02", posx, posy)
			pMonster:AddParticle("Tytaros_Eyebeam_03", posx, posy)
			pMonster:AddParticle("Tytaros_Eyebeam_04", posx, posy)
			pMonster:AddParticle("Tytaros_Eyebeam_05", posx, posy)
		end
		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ��������
function Tytaros_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    local iEndFrame = pMonster:GetLastFrame()
    
    if( iFrame == 61 ) then
		pMonster:PlaySound( 998010 )
    elseif( iFrame == 64 ) then
		pMonster:AddDamage(DT_TYTAROS_ATK1_1)
	elseif( iFrame == 110 ) then
		pMonster:PlaySound( 998010 )
    elseif( iFrame == 113 ) then
		pMonster:AddDamage(DT_TYTAROS_ATK1_2)
	elseif( iFrame == 155 ) then
		pMonster:PlaySound( 998010 )
    elseif( iFrame == 158 ) then
		pMonster:AddDamage(DT_TYTAROS_ATK1_3)
    elseif( iFrame >= iEndFrame ) then		
        pMonster:SetState( "WAIT" )
    end
end

--  �ݰ� �չٴ� ¦
function Tytaros_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 52 ) then
		pMonster:PlaySound( 998011 )
    elseif( iFrame == 55 ) then
		pMonster:AddDamage(DT_TYTAROS_CLAP)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ����� ����
function Tytaros_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:StartText("DANGER")
	elseif( iFrame == 50 ) then
		pMonster:AddDamageWithLocate( DT_TYTAROS_STONE, -1.20, 1.7)
        pMonster:AddDamageWithLocate( DT_TYTAROS_STONE, 1.40, 1.7)
		pMonster:AddDamageWithLocate( DT_TYTAROS_STONE, -0.50, 1.9)
	elseif( iFrame == 51 ) then
			pMonster:PlaySound( 998012 )
	elseif( iFrame == 54 ) then
		pMonster:CameraVib( 1, 0.6, 0.008 )
	elseif( iFrame == 60 ) then
		pMonster:AddDamageWithLocate( DT_TYTAROS_STONE, -1.40, 1.7)
		pMonster:AddDamageWithLocate( DT_TYTAROS_STONE, 1.00, 1.8)
		pMonster:AddDamageWithLocate( DT_TYTAROS_STONE, 1.60, 2.0)
		pMonster:AddDamageWithLocate( DT_TYTAROS_STONE, -0.20, 2.1)
		pMonster:AddDamageWithLocate( DT_TYTAROS_STONE, -1.76, 2.3)
		pMonster:AddDamageWithLocate( DT_TYTAROS_STONE, 0.90, 2.4)
		pMonster:AddDamageWithLocate( DT_TYTAROS_STONE, 1.40, 2.6)
		pMonster:AddDamageWithLocate( DT_TYTAROS_STONE, 0.30, 2.7)
		pMonster:AddDamageWithLocate( DT_TYTAROS_STONE, -2.00, 2.7)
		pMonster:AddDamageWithLocate( DT_TYTAROS_STONE, 0.00, 2.8)
		pMonster:AddDamageWithLocate( DT_TYTAROS_STONE, 2.00, 3.0)
		pMonster:AddDamageWithLocate( DT_TYTAROS_STONE, -0.50, 3.1)
	elseif( iFrame == 92 ) then
			pMonster:PlaySound( 998012 )
	elseif( iFrame == 95 ) then
		pMonster:CameraVib( 1, 0.6, 0.008 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ������
function Tytaros_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 45 ) then
        --pMonster:SkillReadyEffectNoStop( 20, 20, 20, 0.5 )
        pMonster:SkillReadyEffectNoStop( 0, 0, 0, 0.5 )
    elseif( iFrame == 66 ) then
		pMonster:AddDamage( DT_TYTAROS_SWING )
	elseif( iFrame > 50 and iFrame < 120) then
		if( math.mod( iFrame , 10 ) == 0 ) then
			pMonster:PlaySound( 998013 )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function Tytaros_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Tytaros_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Tytaros_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == false ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function Tytaros_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Tytaros_Check_JumpUp( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 300, -300, 600, 300, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Tytaros_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:SetSuperArmor(true)
		pMonster:ResetDelay()
	end
end

function Tytaros_Check_JumpDown( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

   if( pMonster:CheckTargetInRange( 30, -400, -40, 400, -1000 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetSpeedY( 0.01 )			
		pMonster:SetState( "JUMPDOWN" )
		pMonster:SetSuperArmor(true)
		pMonster:ResetDelay()
	end
end

function Tytaros_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 220, -200, 120, 200, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Tytaros_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    --if( pMonster:IsTarget() == true ) then
	if( pMonster:CheckTargetInRange( 220, -200, 200, 200, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
		pMonster:SetSuperArmor(true)
    end
end

function Tytaros_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    --if( pMonster:IsTarget() == true ) then
	if( pMonster:CheckTargetInRange( 200, -200, 120, 200, -80 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function Tytaros_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    --if( pMonster:CheckTargetInRange( 0, -300, 400, 300, -200 ) == true ) then
	if( pMonster:IsTarget() == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
    end
end

function Tytaros_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -160, 280, 160, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
    end
end
-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnTytaros_Land( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMPDOWN" ) == true ) then
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
		pMonster:SetState( "LANDING" )
    end
	
	if( pMonster:GetHP() <= 0 ) then
		pMonster:SetState( "DIE" )
	end
end

function OnTytaros_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:TurnToTarget()
	pMonster:SetState( "DIE" )
end

function OnTytaros_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetNoCheckContact( 0 )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	   
    pMonster:SetPushCheck( true )
	pMonster:SetFly( false ) 
	
	if ( pMonster:FloatRand() < 0.05 and pMonster:IsSuperArmor() == false and pMonster:CheckState("DOWN") == false ) then
		if ( pMonster:FloatRand() < 0.5 ) then
			pMonster:SetState( "ATTACK04" )	
		else
			pMonster:SetState( "ATTACK05" )	
		end
		pMonster:TurnToTarget()
        pMonster:SetSuperArmor(true)
	end
end

function Tytaros_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.8) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
	pMonster:SetIgnoreFHCheck(true)
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end