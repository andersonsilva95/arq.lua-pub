-- AI_PoisonSpiderQueen.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "PoisonSpider_Wait.frm",
        Func    = "PoisonSpiderQueen_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 50,
                AIFunc              = "PoisonSpiderQueen_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 100,
                AIFunc              = "PoisonSpiderQueen_Check_ReleaseTarget",
                DelayFrame          = 150,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 55,
                AIFunc              = "PoisonSpiderQueen_Check_TurnToTarget",
                DelayFrame          = 75,
            },
            -- �ȱ�
            {
                AICheckFrame        = 100,
                AIFunc              = "PoisonSpiderQueen_Check_Walk",
                DelayFrame          = 200,
            },
            -- ������
            {
                AICheckFrame        = 75,
                AIFunc              = "PoisonSpiderQueen_Check_Attack01",
                DelayFrame          = 55,
            },
            -- ���׳����
            {
                AICheckFrame        = 100,
                AIFunc              = "PoisonSpiderQueen_Check_Attack02",
                DelayFrame          = 500,
            },
            -- �Ź̼�ȯ
            {
                AICheckFrame        = 1000,
                AIFunc              = "PoisonSpiderQueen_Check_Attack03",
                DelayFrame          = 1000,
            },
            -- ��������
            {
                AICheckFrame        = 75,
                AIFunc              = "PoisonSpiderQueen_Check_HighJump",
                DelayFrame          = 75,
            },
            -- �����ٿ�
            {
                AICheckFrame        = 200,
                AIFunc              = "PoisonSpiderQueen_Check_JumpDown",
                DelayFrame          = 500,
            },			
            -- ������(�̵�)
            {
                AICheckFrame        = 110,
                AIFunc              = "PoisonSpiderQueen_Check_Idle",
                DelayFrame          = 110,
            },
        },
    },

    -- �̵�
    {
        ID      = "WALK",
        Motion  = "PoisonSpider_Walk.frm",
        Func    = "PoisonSpiderQueen_WalkFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "PoisonSpiderQueen_MoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 25,
                AIFunc              = "PoisonSpiderQueen_Check_Targeting",
                DelayFrame          = 110,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 55,
                AIFunc              = "PoisonSpiderQueen_Check_TurnToTarget",
                DelayFrame          = 55,
            },            
            -- ������
            {
                AICheckFrame        = 55,
                AIFunc              = "PoisonSpiderQueen_Check_Attack01",
                DelayFrame          = 110,
            },
            -- ���׳����
            {
                AICheckFrame        = 55,
                AIFunc              = "PoisonSpiderQueen_Check_Attack02",
                DelayFrame          = 110,
            },
            -- ���߱�
            {
                AICheckFrame        = 10,
                AIFunc              = "PoisonSpiderQueen_Check_Stop",
                DelayFrame          = 60,
            },            
        }
    },
	
	-- ������
    {
        ID      = "IDLE",
        Motion  = "PoisonSpider_Walk.frm",
        Func    = "PoisonSpiderQueen_IdleFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "PoisonSpiderQueen_IdleMoveFail",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 55,
                AIFunc              = "PoisonSpiderQueen_Check_Targeting",
                DelayFrame          = 110,
            },
            -- ������(����)
            {
                AICheckFrame        = 100,
                AIFunc              = "PoisonSpiderQueen_Check_Idle_Stop",
                DelayFrame          = 200,
            },
        }
    },
    
    -- ������
    {
        ID      = "ATTACK01",
        Motion  = "PoisonSpider_Attack01.frm",
        Func    = "PoisonSpiderQueen_Attack01Func",
    },
    
    -- ���׳����
    {
        ID      = "ATTACK02",
        Motion  = "PoisonSpider_Attack02.frm",
        Func    = "PoisonSpiderQueen_Attack02Func",
    },
    
    -- �Ź̼�ȯ
    {
        ID      = "ATTACK03",
        Motion  = "PoisonSpider_Queen_Summon.frm",
        Func    = "PoisonSpiderQueen_Attack03Func",
    },
    
    -- ����
    {
        ID      = "JUMP",
        Motion  = "PoisonSpider_Jump.frm",
        Func    = "PoisonSpiderQueen_JumpFunc",
    },
    
    -- ���� ����
    {
        ID      = "JUMP_LANDING",
        Motion  = "PoisonSpider_JumpLanding.frm",
        Func    = "PoisonSpiderQueen_JumpLandingFunc",
    },

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "PoisonSpider_Damage_Up.frm",
        Func    = "PoisonSpiderQueen_DamageFunc",
    },
	
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "PoisonSpider_Damage_Down.frm",
        Func    = "PoisonSpiderQueen_DamageFunc",
    },
	
	-- �ٿ� ��
    {
        ID      = "DOWN_UP",
        Motion  = "PoisonSpider_Down_Up01.frm",
        Func    = "PoisonSpiderQueen_DownUpFunc",
    },
	
	-- �ٿ� �� ����
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "PoisonSpider_Down_Up02.frm",
        Func    = "PoisonSpiderQueen_DownFunc",
		
		Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "PoisonSpiderQueen_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� 
    {
        ID      = "DOWN",
        Motion  = "PoisonSpider_Down.frm",
        Func    = "PoisonSpiderQueen_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "PoisonSpiderQueen_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "PoisonSpider_Standup.frm",
        Func    = "PoisonSpiderQueen_StandupFunc",
    },
    
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "PoisonSpider_Die.frm",
        Func    = "PoisonSpiderQueen_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "PoisonSpider_Stone.frm",
        Func    = "PoisonSpiderQueen_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "PoisonSpider_Stone.frm",
        Func    = "PoisonSpiderQueen_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "PoisonSpider_Stone.frm",
		Func	= "PoisonSpiderQueen_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnPoisonSpiderQueen_Land",
    Die     = "OnPoisonSpiderQueen_Die",
    Damage  = "OnPoisonSpiderQueen_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitPoisonSpider_Queen( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DOWN_UP" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DOWN" )
    
	pMonster:RegistReaction( ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )

	pMonster:RegisterSummonMonsterType( MON_POISON_SPIDER_MINI )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function PoisonSpiderQueen_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- �ȱ� ����
function PoisonSpiderQueen_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
    
	if( iFrame == 3 ) then
		pMonster:PlaySound(1220)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- ������ ����
function PoisonSpiderQueen_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame == 3 ) then
		pMonster:PlaySound(1220)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
end


--  ������ ����
function PoisonSpiderQueen_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= 1 and iFrame < 13 ) then		
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -1.0 )
	elseif( iFrame == 24 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 8.0 )
	elseif( iFrame == 29 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -1.5 )
		pMonster:PlaySound(1217)
	elseif( iFrame == 30 ) then
		--pMonster:AddDamage( DT_POISONSPIDER_ATTACK01 )
		pMonster:StartAttack( 12, PAR_FRONTDOWN_0, 0.0, 7, 13, 6)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ���׳���� ����
function PoisonSpiderQueen_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then		
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 69 ) then
		pMonster:PlaySound(999007)
    elseif( iFrame == 73 ) then
		pMonster:AddDamage( DT_SPIDERQUEEN_WEB_ATK )
	elseif( iFrame == 76 ) then
	elseif( iFrame >= 101 and iFrame < 111 ) then
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �Ź̼�ȯ ����
function PoisonSpiderQueen_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 10 ) then
		pMonster:PlaySound(999005)
	elseif( iFrame == 65 ) then
	    pMonster:PlaySound(999006)
    elseif( iFrame == 70 ) then
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_POISON_SPIDER_MINI
        pMon.fX = -200
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_POISON_SPIDER_MINI
		pMon.fX = 200
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ���� ����
function PoisonSpiderQueen_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �������� ����
function PoisonSpiderQueen_JumpLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �״»���
function PoisonSpiderQueen_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1) then
		pMonster:SetInvincible( true )
		pMonster:PlaySound(999073)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function PoisonSpiderQueen_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 1 ) then
		--pMonster:PlaySound(1218)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ� ��
function PoisonSpiderQueen_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmorFrame( pMonster:GetLastFrame() + 10 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
    end
end


-- �ٿ�
function PoisonSpiderQueen_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )				
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end

-- �Ͼ��
function PoisonSpiderQueen_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
    if( iFrame <= 1) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )        
    end
end


--  ����Ŀ�� �ɷ���
function PoisonSpiderQueen_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "StoneCurse_medium", 3 )
        pMonster:AddParticle( "StoneCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_medium_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "StoneCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_medium_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DOWN" )
		end
    end
end

--  ���̽�Ŀ�� �ɷ���
function PoisonSpiderQueen_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "IceCurse_medium", 3 )
        pMonster:AddParticle( "IceCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_medium_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "IceCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_medium_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DOWN" )
		end
    end
end


-- Ȧ�� �ɷ���(����Ʈ)
function PoisonSpiderQueen_HoldFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor(true)
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_01_Middle", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_02_Middle", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_03_Middle", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_04_Middle", 0.0, 0.12 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSuperArmor( false )
		pMonster:SetState( "WAIT" )
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DOWN" )
		end
	end
end

-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function PoisonSpiderQueen_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -400, 200, 400, -100 ) == true or pMonster:SetTarget( 0, -200, 400, 200, -200 ) == true ) then
		pMonster:TurnToTarget()
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end
end

function PoisonSpiderQueen_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 200, -300, 250, 300, -150 ) == false ) then
		pMonster:ReleaseTarget()
        pMonster:ResetDelay()
	end
end


function PoisonSpiderQueen_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function PoisonSpiderQueen_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 600, -500, 500, 500, -500 ) == true and pMonster:CheckTargetInRange( 100, -150, 250, 150, -200 ) == false ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function PoisonSpiderQueen_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -900, 500, 900, -400 ) == false or pMonster:CheckTargetInRange( 100, -150, 250, 150, -200 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function PoisonSpiderQueen_Check_HighJump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -100, 300, 100, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		PoisonSpiderQueen_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function PoisonSpiderQueen_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

   if( pMonster:CheckTargetInRange( 110, -100, -40, 100, -300 ) == true ) then
        pMonster:SetNoCheckContact(15)
        pMonster:SetIgnoreFHCheck(true)      
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function PoisonSpiderQueen_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -120, 130, 120, -40 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function PoisonSpiderQueen_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 300, -100, 120, 100, -40 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function PoisonSpiderQueen_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:GetSummonedMonsterCount() < 2 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end


function PoisonSpiderQueen_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-- ������..
function PoisonSpiderQueen_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
		pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end


-- ������ ��.. ���߱�
function PoisonSpiderQueen_Check_Idle_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "WAIT" )
    end
end


-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnPoisonSpiderQueen_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:CheckState( "JUMP" ) == true ) then		
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
		pMonster:SetState( "JUMP_LANDING" )
	elseif( pMonster:CheckState( "DOWN_UP" ) == true ) then
        pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )
        pMonster:SetState( "DOWN_UP_LANDING" )
    end    
end

function OnPoisonSpiderQueen_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:TurnToTarget()	
		pMonster:SetState( "DOWN" )
	end	
end

function OnPoisonSpiderQueen_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetPushCheck( true )	
	pMonster:SetSpeedX( (pMonster:GetSpeedX() * 9.0 ) / 10.0 )
    pMonster:SetSpeedY( ( pMonster:GetSpeedY() * 9.0 ) / 10.0 )
	
    if( pMonster:CheckState( "JUMP" ) == true ) then
        if( pMonster:IsSuperArmor() == false ) then
            pMonster:SetNoCheckContact( 5 )
        end
	end
    
	if( pMonster:CheckState( "DOWN" ) == true or pMonster:CheckState( "DOWN_UP" ) == true ) then
		pMonster:SetSpeedY( pMonster:GetSpeedY() / 1.8 )
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )
	end		
end

function PoisonSpiderQueen_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.1)) + (((fTargetY - fMonY) * 1.6) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function PoisonSpiderQueen_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.0) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(40)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.042 )			
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.0120)			
		end
	end
end

function PoisonSpiderQueen_IdleMoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetIsRight() == true ) then
            pMonster:SetIsRight( false )
            pMonster:SetSpeedX( -0.005 )        
        else
            pMonster:SetIsRight( true )
            pMonster:SetSpeedX( 0.005 )        
        end    
        
        pMonster:SetState( "IDLE" )		
	end
end
