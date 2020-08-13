-- AI_LenasienBoss.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Lenasien_Wait.frm",
        Func    = "LenasienBoss_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 25,
                AIFunc              = "LenasienBoss_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 55,
                AIFunc              = "LenasienBoss_Check_TurnToTarget",
                DelayFrame          = 55,
            },  
            -- �ȱ�
            {
                AICheckFrame        = 55,
                AIFunc              = "LenasienBoss_Check_Walk",
                DelayFrame          = 55,
            },            
            -- ��������
            {
                AICheckFrame        = 45,
                AIFunc              = "LenasienBoss_Check_Attack01",
                DelayFrame          = 55,
            },
            -- ������ �÷���01
            {
                AICheckFrame        = 75,
                AIFunc              = "LenasienBoss_Check_Attack02",
                DelayFrame          = 110,
            },
            -- ����
            {
                AICheckFrame        = 75,
                AIFunc              = "LenasienBoss_Check_Attack04",
                DelayFrame          = 110,
            },
            -- ������
            {
                AICheckFrame        = 75,
                AIFunc              = "LenasienBoss_Check_Attack05",
                DelayFrame          = 220,
            },
            -- ������ �÷���02
            {
                AICheckFrame        = 55,
                AIFunc              = "LenasienBoss_Check_Attack03",
                DelayFrame          = 110,
            },
			-- ��ȯ
            {
                AICheckFrame        = 165,
                AIFunc              = "LenasienBoss_Check_Attack06",
                DelayFrame          = 2200,
            },
            -- ��������
            {
                AICheckFrame        = 55,
                AIFunc              = "LenasienBoss_Check_JumpUp",
                DelayFrame          = 75,
            },
            -- �����ٿ�
            {
                AICheckFrame        = 75,
                AIFunc              = "LenasienBoss_Check_JumpDown",
                DelayFrame          = 75,
            },
        },
    },

    -- �̵�
    {
        ID      = "WALK",
        Motion  = "Lenasien_Walk.frm",
        Func    = "LenasienBoss_WalkFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "LenasienBoss_MoveFail",

        Trigger =
        {
			-- Ÿ����
	    {
                AICheckFrame        = 25,
                AIFunc              = "LenasienBoss_Check_Targeting",
                DelayFrame          = 110,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 55,
                AIFunc              = "LenasienBoss_Check_TurnToTarget",
                DelayFrame          = 55,
            },            
			-- ��������
            {
                AICheckFrame        = 35,
                AIFunc              = "LenasienBoss_Check_Attack01",
                DelayFrame          = 55,
            },
            -- ������ �÷���01
            {
                AICheckFrame        = 75,
                AIFunc              = "LenasienBoss_Check_Attack02",
                DelayFrame          = 110,
            },
            -- ��������
            {
                AICheckFrame        = 35,
                AIFunc              = "LenasienBoss_Check_JumpUp",
                DelayFrame          = 75,
            },
            -- �����ٿ�
            {
                AICheckFrame        = 75,
                AIFunc              = "LenasienBoss_Check_JumpDown",
                DelayFrame          = 75,
            },
            -- ���߱�
            {
                AICheckFrame        = 10,
                AIFunc              = "LenasienBoss_Check_Stop",
                DelayFrame          = 55,
            },
        }
    },
    
    -- ��������01
    {
        ID      = "ATTACK01",
        Motion  = "Lenasien_Attack01.frm",
        Func    = "LenasienBoss_Attack01Func",
    },
    
    -- ������ �÷���01
    {
        ID      = "ATTACK02",
        Motion  = "Lenasien_Attack02.frm",
        Func    = "LenasienBoss_Attack02Func",
    },        
    
    -- ������ �÷���02
    {
        ID      = "ATTACK03",
        Motion  = "Lenasien_Attack03.frm",
        Func    = "LenasienBoss_Attack03Func",
    },        
    
    -- ����
    {
        ID      = "ATTACK04",
        Motion  = "Lenasien_Attack04.frm",
        Func    = "LenasienBoss_Attack04Func",
    },
    
    -- ������
    {
        ID      = "ATTACK05",
        Motion  = "Lenasien_Attack05.frm",
        Func    = "LenasienBoss_Attack05Func",
    },
	
	-- ��ȯ
    {
        ID      = "ATTACK06",
        Motion  = "Lenasien_Attack06.frm",
        Func    = "LenasienBoss_Attack06Func",
    },
    
    -- ������
    {
        ID      = "JUMP",
        Motion  = "Lenasien_Jump.frm",
        Func    = "LenasienBoss_JumpFunc",
    },
    
    -- �����ٿ�
    {
        ID      = "JUMPDOWN",
        Motion  = "Lenasien_JumpDown.frm",
        Func    = "LenasienBoss_JumpFunc",
    },
    
    -- ����
    {
        ID      = "LANDING",
        Motion  = "Lenasien_Attack03_Landing.frm",
        Func    = "LenasienBoss_LandingFunc",
    },
    
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "Lenasien_Die.frm",
        Func    = "LenasienBoss_DieFunc",
    },
}

CallBack =
{
    Land    = "OnLenasienBoss_Land",
    Die     = "OnLenasienBoss_Die",
    Damage  = "OnLenasienBoss_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitLenasienBoss( iMonsterIndex )
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
	pMonster:RegisterSummonMonsterType( MON_INDIAN_SPEARMAN )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function LenasienBoss_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- �ȱ� ����
function LenasienBoss_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- �״»���
function LenasienBoss_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:PlaySound(484)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
    end
end

-- ������ ������
function LenasienBoss_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 10 ) then	
	pMonster:PlaySound(485)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ���� ����
function LenasienBoss_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- ���� ����
function LenasienBoss_LandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function LenasienBoss_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 16 ) then
        pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -0.5 )
    elseif( iFrame >= 31 and iFrame < 41 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
		if( iFrame == 31 ) then
			pMonster:PlaySound(479)
		end
	elseif( iFrame == 41 ) then
        pMonster:AddDamage( DT_RENASIEN_ATK1_1 )
    elseif( iFrame >= 56 and iFrame < 66 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
		if( iFrame == 56 ) then
			pMonster:PlaySound(479)
		end
	elseif( iFrame == 66 ) then
        pMonster:AddDamage( DT_RENASIEN_ATK1_2 )
    elseif( iFrame >= 91 and iFrame < 111 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
		if( iFrame == 91 ) then
			pMonster:PlaySound(479)
		end
		if( iFrame == 101 ) then
			pMonster:AddDamage( DT_RENASIEN_ATK1_3 )
		elseif( iFrame == 105 ) then 
			pMonster:AddDamage( DT_RENASIEN_ATK1_4 )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ������ �÷���01 ����
function LenasienBoss_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
	pMonster:PlaySound(481)
    elseif( iFrame == 21 ) then
		pMonster:AddParticle( "Renasien_poison_effect01", 0.0, 0.6 )
		pMonster:AddParticle( "Renasien_poison_effect02", 0.0, 0.6 )
    elseif( iFrame == 61 ) then
		pMonster:PlaySound(482)	
		pMonster:AddParticle( "Renasien_poison_shoteffect01", 0.4, 0.45 )
		pMonster:AddParticle( "Renasien_poison_shoteffect02", 0.4, 0.45 )
		pMonster:AddDamage( DT_RENASIEN_ATK3_R )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
		pMonster:TurnToTarget()
        pMonster:SetState( "WAIT" )
    end
end

--  ������ �÷���02 ����
function LenasienBoss_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0 )            
        pMonster:SetSuperArmor( true )
		pMonster:PlaySound(481)	
    elseif( iFrame == 36 ) then
		pMonster:SetCountValue(80)	
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -2.0 )
		pMonster:SetSpeedY( 0.05 )  
	elseif( iFrame == 51 ) then
		pMonster:PlaySound(482)	
		pMonster:SetSpeedY( 0.0 )          
		pMonster:SetFly( true )
	elseif( iFrame == 66 ) then
		pMonster:AddDamage( DT_RENASIEN_ATK4_R )
	elseif( iFrame == 86 ) then
		pMonster:SetFly( false )    
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ���� ����
function LenasienBoss_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame < 31 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -1.0 )
    elseif( iFrame >= 51 and iFrame < 61 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 15.0 )
	elseif( iFrame == 61 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 5.0 )
    end
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 51 ) then
	pMonster:PlaySound(480)
        pMonster:AddDamage( DT_RENASIEN_ATK2_1 )
        if( pMonster:GetIsRight() == true ) then
			pMonster:AddParticle( "Renasien_Special5_01R", 0.0, 0.0 )
		else
			pMonster:AddParticle( "Renasien_Special5_01L", 0.0, 0.0 )
		end
    elseif( iFrame == 86 ) then
	pMonster:PlaySound(480)
        pMonster:AddDamage( DT_RENASIEN_ATK2_2 )
		if( pMonster:GetIsRight() == true ) then
			pMonster:AddParticle( "Renasien_Special5_02R", 0.0, 0.0 )
		else
			pMonster:AddParticle( "Renasien_Special5_02L", 0.0, 0.0 )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ������ ����
function LenasienBoss_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 41 ) then
        pMonster:AddDamage( DT_RENASIEN_ATK5_1 )
		pMonster:PlaySound(483)
    elseif( iFrame == 63 ) then
		pMonster:PlaySound(483)
		if( pMonster:GetIsRight() == true ) then
			pMonster:AddDamage( DT_RENASIEN_ATK5_2_R )
		else
			pMonster:AddDamage( DT_RENASIEN_ATK5_2_L )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ��ȯ ����
function LenasienBoss_Attack06Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
	elseif( iFrame == 31 ) then
		pMonster:PlaySound(482)	
    elseif( iFrame == 71 ) then
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_INDIAN_SPEARMAN
        pMon.fX = -100
        pMon.fY = 150
        pMonster:SummonMonster( pMon )
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_INDIAN_SPEARMAN
		pMon.fX = 0
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_INDIAN_SPEARMAN
		pMon.fX = 100
        pMon.fY = 150
        pMonster:SummonMonster( pMon )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function LenasienBoss_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function LenasienBoss_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function LenasienBoss_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == false ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function LenasienBoss_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function LenasienBoss_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -300, 600, 300, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		LenasienBoss_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
        pMonster:SetSuperArmor(true)
		pMonster:ResetDelay()
    end
end

function LenasienBoss_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

   if( pMonster:CheckTargetInRange( 400, -400, -20, 400, -1000 ) == true ) then
        pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
        pMonster:SetSpeedY( 0.01 )            
		pMonster:SetState( "JUMPDOWN" )
        pMonster:SetSuperArmor(true)
		pMonster:ResetDelay()
    end
end

function LenasienBoss_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, 200, 150, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function LenasienBoss_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 500, -200, 200, 200, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function LenasienBoss_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 300, -100, -50, 100, -250 ) == true or pMonster:CheckTargetInRange( 500, -100, -250, 100, -500 ) == true ) then		
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function LenasienBoss_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 500, -200, 200, 200, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
    end
end

function LenasienBoss_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 300, -300, 400, 300, -100 ) == true ) then
		pMonster:SetCountValue(0)
		pMonster:SetSpeedX( 0.0 )            
		pMonster:SetSpeedY( 0.0 )            
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
    end
end

function LenasienBoss_Check_Attack06( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:GetSummonedMonsterCount() < 2 ) then
		pMonster:SetSpeedX( 0.0 )            
		pMonster:SetSpeedY( 0.0 )            
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK06" )
		pMonster:ResetDelay()
    end
end


-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnLenasienBoss_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
		
	if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMPDOWN" ) == true ) then		
		pMonster:TurnToTarget()
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
		pMonster:SetState( "WAIT" )
	elseif( pMonster:CheckState( "ATTACK03" ) == true ) then		
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
		pMonster:SetState( "LANDING" )
	end
end

function OnLenasienBoss_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
		pMonster:TurnToTarget()
	
		pMonster:SetState( "DIE" )
	end
	
end

function OnLenasienBoss_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "JUMP" ) == false and pMonster:CheckState( "JUMPDOWN" ) == false ) then
		pMonster:SetNoCheckContact( 0 )
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )    
	end
    
    if ( pMonster:FloatRand() < 0.2 and pMonster:IsSuperArmor() == false ) then	
        pMonster:TurnToTarget()
        pMonster:SetState( "ATTACK04" )
        pMonster:SetSuperArmor(true)
	end
	
    pMonster:SetPushCheck( true )
	pMonster:SetFly( false ) 
end

function LenasienBoss_Jump( iMonsterIndex )
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

function LenasienBoss_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.1) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(40)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.042 )			
		else
			pMonster:SetNoCheckContact(30)
			pMonster:SetState( "JUMPDOWN" )
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.0120)			
		end
	end
end
