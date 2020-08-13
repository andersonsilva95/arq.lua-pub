-- AI_PoisonSpiderQueen.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "PoisonSpider_Wait.frm",
        Func    = "PoisonSpiderQueen_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 50,
                AIFunc              = "PoisonSpiderQueen_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 100,
                AIFunc              = "PoisonSpiderQueen_Check_ReleaseTarget",
                DelayFrame          = 150,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 55,
                AIFunc              = "PoisonSpiderQueen_Check_TurnToTarget",
                DelayFrame          = 75,
            },
            -- 걷기
            {
                AICheckFrame        = 100,
                AIFunc              = "PoisonSpiderQueen_Check_Walk",
                DelayFrame          = 200,
            },
            -- 깨물기
            {
                AICheckFrame        = 75,
                AIFunc              = "PoisonSpiderQueen_Check_Attack01",
                DelayFrame          = 55,
            },
            -- 독액내뱉기
            {
                AICheckFrame        = 100,
                AIFunc              = "PoisonSpiderQueen_Check_Attack02",
                DelayFrame          = 500,
            },
            -- 거미소환
            {
                AICheckFrame        = 1000,
                AIFunc              = "PoisonSpiderQueen_Check_Attack03",
                DelayFrame          = 1000,
            },
            -- 하이점프
            {
                AICheckFrame        = 75,
                AIFunc              = "PoisonSpiderQueen_Check_HighJump",
                DelayFrame          = 75,
            },
            -- 점프다운
            {
                AICheckFrame        = 200,
                AIFunc              = "PoisonSpiderQueen_Check_JumpDown",
                DelayFrame          = 500,
            },			
            -- 어슬렁대기(이동)
            {
                AICheckFrame        = 110,
                AIFunc              = "PoisonSpiderQueen_Check_Idle",
                DelayFrame          = 110,
            },
        },
    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "PoisonSpider_Walk.frm",
        Func    = "PoisonSpiderQueen_WalkFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "PoisonSpiderQueen_MoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 25,
                AIFunc              = "PoisonSpiderQueen_Check_Targeting",
                DelayFrame          = 110,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 55,
                AIFunc              = "PoisonSpiderQueen_Check_TurnToTarget",
                DelayFrame          = 55,
            },            
            -- 깨물기
            {
                AICheckFrame        = 55,
                AIFunc              = "PoisonSpiderQueen_Check_Attack01",
                DelayFrame          = 110,
            },
            -- 독액내뱉기
            {
                AICheckFrame        = 55,
                AIFunc              = "PoisonSpiderQueen_Check_Attack02",
                DelayFrame          = 110,
            },
            -- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "PoisonSpiderQueen_Check_Stop",
                DelayFrame          = 60,
            },            
        }
    },
	
	-- 어슬렁대기
    {
        ID      = "IDLE",
        Motion  = "PoisonSpider_Walk.frm",
        Func    = "PoisonSpiderQueen_IdleFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "PoisonSpiderQueen_IdleMoveFail",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 55,
                AIFunc              = "PoisonSpiderQueen_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 어슬렁대기(멈춤)
            {
                AICheckFrame        = 100,
                AIFunc              = "PoisonSpiderQueen_Check_Idle_Stop",
                DelayFrame          = 200,
            },
        }
    },
    
    -- 깨물기
    {
        ID      = "ATTACK01",
        Motion  = "PoisonSpider_Attack01.frm",
        Func    = "PoisonSpiderQueen_Attack01Func",
    },
    
    -- 독액내뱉기
    {
        ID      = "ATTACK02",
        Motion  = "PoisonSpider_Attack02.frm",
        Func    = "PoisonSpiderQueen_Attack02Func",
    },
    
    -- 거미소환
    {
        ID      = "ATTACK03",
        Motion  = "PoisonSpider_Queen_Summon.frm",
        Func    = "PoisonSpiderQueen_Attack03Func",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "PoisonSpider_Jump.frm",
        Func    = "PoisonSpiderQueen_JumpFunc",
    },
    
    -- 점프 착지
    {
        ID      = "JUMP_LANDING",
        Motion  = "PoisonSpider_JumpLanding.frm",
        Func    = "PoisonSpiderQueen_JumpLandingFunc",
    },

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "PoisonSpider_Damage_Up.frm",
        Func    = "PoisonSpiderQueen_DamageFunc",
    },
	
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "PoisonSpider_Damage_Down.frm",
        Func    = "PoisonSpiderQueen_DamageFunc",
    },
	
	-- 다운 상
    {
        ID      = "DOWN_UP",
        Motion  = "PoisonSpider_Down_Up01.frm",
        Func    = "PoisonSpiderQueen_DownUpFunc",
    },
	
	-- 다운 상 착지
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
    
    -- 다운 
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
    
    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "PoisonSpider_Standup.frm",
        Func    = "PoisonSpiderQueen_StandupFunc",
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "PoisonSpider_Die.frm",
        Func    = "PoisonSpiderQueen_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "PoisonSpider_Stone.frm",
        Func    = "PoisonSpiderQueen_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "PoisonSpider_Stone.frm",
        Func    = "PoisonSpiderQueen_IceCurseFunc",
    },
    -- 홀드상태
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
-- 초기화 함수
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
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function PoisonSpiderQueen_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 걷기 상태
function PoisonSpiderQueen_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
    
	if( iFrame == 3 ) then
		pMonster:PlaySound(1220)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 어슬렁대기 상태
function PoisonSpiderQueen_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame == 3 ) then
		pMonster:PlaySound(1220)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
end


--  깨물기 상태
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

-- 독액내뱉기 상태
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

--  거미소환 상태
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

-- 점프 상태
function PoisonSpiderQueen_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 점프착지 상태
function PoisonSpiderQueen_JumpLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 죽는상태
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

-- 데미지 입은거
function PoisonSpiderQueen_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 1 ) then
		--pMonster:PlaySound(1218)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다운 상
function PoisonSpiderQueen_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmorFrame( pMonster:GetLastFrame() + 10 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
    end
end


-- 다운
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

-- 일어나기
function PoisonSpiderQueen_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
    if( iFrame <= 1) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )        
    end
end


--  스톤커스 걸렸음
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

--  아이스커스 걸렸음
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


-- 홀드 걸렸음(이펙트)
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
-- 컨디션체크
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

-- 어슬렁대기..
function PoisonSpiderQueen_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
		pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end


-- 어슬렁대는 중.. 멈추기
function PoisonSpiderQueen_Check_Idle_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "WAIT" )
    end
end


-----------------------------------------------------------------------
-- 콜백 함수
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
