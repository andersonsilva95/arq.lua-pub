-- AI_FireGolem.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "hell_guard_soldier_Wait.frm",
        Func    = "FireGolem_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 55,
                AIFunc              = "FireGolem_Check_Targeting",
                DelayFrame          = 330,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 75,
                AIFunc              = "FireGolem_Check_TurnToTarget",
                DelayFrame          = 75,
            },

            -- �ȱ�
            {
                AICheckFrame        = 75,
                AIFunc              = "FireGolem_Check_Walk",
                DelayFrame          = 110,
            },
            -- ��������
            {
                AICheckFrame        = 55,
                AIFunc              = "FireGolem_Check_Attack01",
                DelayFrame          = 110,
            },
            -- ���̾�극��
            {
                AICheckFrame        = 75,
                AIFunc              = "FireGolem_Check_Attack02",
                DelayFrame          = 110,
            },
            -- ��������
            {
                AICheckFrame        = 330,
                AIFunc              = "FireGolem_Check_Attack03",
                DelayFrame          = 750,
				DelayFrame1         = 660,
				DelayFrame2         = 430,
            },
            
            -- �г��� ȭ�����
            {
                AICheckFrame        = 145,
                AIFunc              = "FireGolem_Check_Attack04",
                DelayFrame          = 110,
            },

            -- ��������
            {
                AICheckFrame        = 35,
                AIFunc              = "FireGolem_Check_HighJump",
                DelayFrame          = 40,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 35,
                AIFunc              = "FireGolem_Check_JumpDown",
                DelayFrame          = 40,
            },

        },
    },

    -- �̵�
    {
        ID      = "WALK",
        Motion  = "hell_guard_soldier_move.frm",
        Func    = "FireGolem_WalkFunc",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 25,
                AIFunc              = "FireGolem_Check_Targeting",
                DelayFrame          = 110,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 55,
                AIFunc              = "FireGolem_Check_TurnToTarget",
                DelayFrame          = 55,
            },
			-- ��������
            {
                AICheckFrame        = 55,
                AIFunc              = "FireGolem_Check_Attack01",
                DelayFrame          = 220,
            },
            -- ���̾�극��
            {
                AICheckFrame        = 75,
                AIFunc              = "FireGolem_Check_Attack02",
                DelayFrame          = 110,
            },
            -- ���߱�
            {
                AICheckFrame        = 10,
                AIFunc              = "FireGolem_Check_Stop",
                DelayFrame          = 55,
            },
            
            -- ��������
            {
                AICheckFrame        = 35,
                AIFunc              = "FireGolem_Check_HighJump",
                DelayFrame          = 40,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 110,
                AIFunc              = "FireGolem_Check_JumpDown",
                DelayFrame          = 220,
            },
        }
    },
    
    -- ��������01
    {
        ID      = "ATTACK01",
        Motion  = "hell_guard_soldier_attack01.frm",
        Func    = "FireGolem_Attack01Func",
    },
    
    -- ���̾�극��
    {
        ID      = "ATTACK02",
        Motion  = "hell_guard_soldier_attack02.frm",
        Func    = "FireGolem_Attack02Func",
    },
    
    -- ��������
    {
        ID      = "ATTACK03",
        Motion  = "hell_guard_soldier_attack03.frm",
        Func    = "FireGolem_Attack03Func",
    },
    
    -- �г��� �ұ��_�Ҹ�������
    {
        ID      = "ATTACK04",
        Motion  = "hell_guard_soldier_attack04.frm",
        Func    = "MiniFireGolem_Attack04Func",
    },
    
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "hell_guard_soldier_Die.frm",
        Func    = "FireGolem_DieFunc",
    },
    
    -- �ױ�
    {
        ID      = "DIE_FIRST",
        Motion  = "hell_guard_soldier_Die.frm",
        Func    = "FireGolem_Die1Func",
    },
    
    -- ����
    {
        ID      = "JUMP",
        Motion  = "hell_guard_soldier_jump_up.frm",
        Func    = "FireGolem_JumpFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_DOWN",
        Motion  = "hell_guard_soldier_jump_down.frm",
        Func    = "FireGolem_JumpDownFunc",
        
        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 50,
                AIFunc              = "FireGolem_Check_Landing",
                DelayFrame          = 1,
            },
        },
    },
    
    -- ����
    {
        ID      = "JUMP_LANDING",
        Motion  = "hell_guard_soldier_jump_landing.frm",
        Func    = "FireGolem_ToWait",
    },
}

CallBack =
{
    Land    = "OnFireGolem_Land",
    Die     = "OnFireGolem_Die",
    Damage  = "OnFireGolem_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function Inithell_guard_soldier( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
--[[
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE" )
--]]
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function FireGolem_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- �ȱ� ����
function FireGolem_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
    
    if( iFrame == 81 ) then
		pMonster:PlaySound( "282" )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:PlaySound( "282" )
        pMonster:SetState( "WALK" )
    end
end

-- �״»���
function FireGolem_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 )then
		pMonster:SetInvincibleFrame( pMonster:GetLastFrame() + 20 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
    end
end

-- �״»���
function FireGolem_Die1Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 )then
		pMonster:SetInvincibleFrame( pMonster:GetLastFrame() + 20 )
        pMonster:EndMonster( false )
        pMonster:ToggleRender(false )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function FireGolem_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function FireGolem_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 10 ) then
		local posX = 0.56
		local posY = 0.4
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticle( "Circulation_special06_effect_01", posX, posY )
			pMonster:AddParticle( "Vulcanus_Charge_01", posX, posY )
			pMonster:AddParticle( "HellBigboy_Cannon_Charge", posX, posY )
		else
			pMonster:AddParticleNoDirection( "Circulation_special06_effect_01", -posX, posY )
			pMonster:AddParticleNoDirection( "Vulcanus_Charge_01", -posX, posY )
			pMonster:AddParticleNoDirection( "HellBigboy_Cannon_Charge", -posX, posY )
		end
    elseif( iFrame == 62 ) then
		local posX = 0.5
		local posY = 0.55
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticle( "Talin_Cannon_Boom_05", posX, posY )
			pMonster:AddParticle( "Engineer_Boom_02", posX, posY )
			pMonster:AddParticle( "HellBigboy_Cannon", posX, posY )
		else
			pMonster:AddParticleNoDirection( "Talin_Cannon_Boom_05", -posX, posY )
			pMonster:AddParticleNoDirection( "Engineer_Boom_02", -posX, posY )
			pMonster:AddParticleNoDirection( "HellBigboy_Cannon_R", -posX, posY )
		end
		
		pMonster:ComputeAngleToTarget( 0.3, 0.5 ) -- Ÿ�������� ������ ���
		local angle = pMonster:GetAngleToTarget()
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocateAngle( DT_HELL_HAMMERMON_ATK1, 0.3, 0.5, false, angle )
		else
			pMonster:AddDamageWithLocateAngle( DT_HELL_HAMMERMON_ATK1, 0.3, 0.5, false, -angle )
		end
		pMonster:PlaySound(985009)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ���̾�극�� ����
function FireGolem_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 45 ) then
        pMonster:StartText( "JUMP" )
    elseif( iFrame == 91 ) then
		pMonster:SkillReadyEffect( 0, 0, 0, 0.0 )
    elseif( iFrame == 130 ) then
		pMonster:EarthQuake( 38, 0.06, 0.025 )
	elseif( iFrame == 175 and not pMonster:GetIsRight() ) then
        pMonster:AddTraceParticleOffset( "Hammer_breath" , -0.1 , 0.4 )    
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function FireGolem_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 45 ) then
        pMonster:StartText( "JUMP" )
    elseif( iFrame == 91 ) then
		pMonster:SkillReadyEffect( 0, 0, 0, 0.0 )
    elseif( iFrame == 108 ) then
		pMonster:EarthQuake( 38, 0.06, 0.025 )
	elseif( iFrame == 165 ) then
		pMonster:EarthQuake( 38, 0.06, 0.025 )
	elseif( iFrame == 225 and not pMonster:GetIsRight() ) then
        pMonster:AddTraceParticleOffset( "Hammer_breath" , -0.1 , 0.4 )    
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ���̾�극���䳻���� ����
function MiniFireGolem_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		local posX = 0.0
		local posY = 0.0
	elseif( iFrame == 65 ) then
		pMonster:AddDamage(DT_HELL_HAMMERMON_ATK4_1)
		local posX = 0.43
		local posY = 0.04
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticle( "Power_Shovel_Arm_01", posX, posY )
			pMonster:AddParticle( "Power_Shovel_Arm_02", posX, posY )
			pMonster:AddParticle( "Power_Shovel_Arm_03", posX, posY )
			pMonster:AddParticle( "Vulcanus_Crash_03", posX, posY )
		else
			posX = -1.0 * posX  
			pMonster:AddParticleNoDirection( "Power_Shovel_Arm_01", posX, posY )
			pMonster:AddParticleNoDirection( "Power_Shovel_Arm_02", posX, posY )
			pMonster:AddParticleNoDirection( "Power_Shovel_Arm_03", posX, posY )
			pMonster:AddParticleNoDirection( "Vulcanus_Crash_03", posX, posY )
		end
		pMonster:PlaySound(985011)
	elseif( iFrame == 88 ) then
		pMonster:AddDamage(DT_HELL_HAMMERMON_ATK4_2)
		local posX = 0.7
		local posY = 0.32
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticle( "HellBigboy_Punch_01", posX, posY )
			pMonster:AddParticle( "HellBigboy_Punch_02", posX, posY )
			pMonster:AddParticle( "HellBigboy_Punch_03", posX, posY )
			pMonster:AddParticle( "HellBigboy_Punch_04", posX, posY )
			pMonster:AddParticle( "Engineer_Boom_01", posX, posY )
		else
			posX = -1.0 * posX  
			pMonster:AddParticleNoDirection( "HellBigboy_Punch_01", posX, posY )
			pMonster:AddParticleNoDirection( "HellBigboy_Punch_02", posX, posY )
			pMonster:AddParticleNoDirection( "HellBigboy_Punch_03_R", posX, posY )
			pMonster:AddParticleNoDirection( "HellBigboy_Punch_04_R", posX, posY )
			pMonster:AddParticleNoDirection( "Engineer_Boom_01", posX, posY )
		end
		pMonster:PlaySound(985012)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


--  ���� ����
function FireGolem_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMP_DOWN")
		pMonster:SetFrameLock( false )
	end

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
		pMonster:SetSuperArmor(true)
    end
end

--  ���� �ٿ� ����
function FireGolem_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
		pMonster:SetSuperArmor(true)
    end
end

--  ���� ����
function FireGolem_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end



-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function FireGolem_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -1500, 800, 1500, -200 ) == true ) then
        pMonster:ResetDelay()
    end
end

function FireGolem_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function FireGolem_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function FireGolem_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function FireGolem_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, 200, 150, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function FireGolem_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 200, -200, 200, 150, -100 ) == true and pMonster:GetCountValue() >= 2 ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function FireGolem_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 200, -200, 400, 200, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function FireGolem_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    --if( pMonster:CheckTargetInRange( 150, -150, 100, 150, -100 ) == true ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
    --end
end

function FireGolem_Check_HighJump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -600, 500, 600, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		FireGolem_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function FireGolem_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 400, -400, -40, 400, -600 ) == true ) then
		pMonster:SetNoCheckContact(15)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:ResetDelay()
    end
end

function FireGolem_Check_Landing( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:GetIsContact() == true ) then
		pMonster:SetState( "JUMP_LANDING" )
		pMonster:ResetDelay()
    end
end
-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnFireGolem_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )

    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    end
end

function OnFireGolem_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
		pMonster:TurnToTarget()
	
		pMonster:SetState( "DIE" )
	end
	
end

function OnFireGolem_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetNoCheckContact( 0 )
    pMonster:SetPushCheck( true )
	pMonster:SetFly( false ) 
	
	if ( pMonster:FloatRand() < 0.05 and pMonster:IsSuperArmor() == false ) then	
		if ( pMonster:FloatRand() < 0.5 ) then
			pMonster:SetState( "ATTACK04" )
		end
		pMonster:TurnToTarget()
        pMonster:SetSuperArmor(true)
	end
    
    pMonster:SetPushCheck( true )
	pMonster:SetFly( false ) 
end


function FireGolem_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
	
	if ( (fTargetY - fMonY) == 0.0 ) then
		fTargetY = fMonY + 0.1
    end
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 3.0) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 2.0))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.008 )
end