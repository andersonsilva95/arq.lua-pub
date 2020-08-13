-- AI_Thanatos1.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Thanatos1_Wait.frm",
        Func    = "Thanatos1_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 40,
                AIFunc              = "Thanatos1_Check_Targeting",
                DelayFrame          = 10,
            },

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 30,
                AIFunc              = "Thanatos1_Check_TurnToTarget",
                DelayFrame          = 30,
            },

            -- 고개 들기
            {
                AICheckFrame        = 20,
                AIFunc              = "Thanatos1_Check_Attack01",
                DelayFrame          = 240,
				DelayFrame1			= 120,
				DelayFrame2			= 40,
				DelayFrame3			= 40,
            },

            -- 눈빛
            {
                AICheckFrame        = 200,
                AIFunc              = "Thanatos1_Check_Attack02",
                DelayFrame          = 300,
				DelayFrame1			= 200,
				DelayFrame2			= 100,
				DelayFrame3			= 100,
            },

            -- 손 튕기기
            {
                AICheckFrame        = 50,
                AIFunc              = "Thanatos1_Check_Attack03",
                DelayFrame          = 450,
				DelayFrame1			= 300,
				DelayFrame2			= 150,
				DelayFrame3			= 150,
            },

            -- 팔 뻗기
            {
                AICheckFrame        = 150,
                AIFunc              = "Thanatos1_Check_Attack04",
                DelayFrame          = 450,
				DelayFrame1			= 300,
				DelayFrame2			= 150,
				DelayFrame3			= 150,
            },

--[[/*
            -- 텔레포트(타겟에게로)
            {
                AICheckFrame        = 140,
                AIFunc              = "Thanatos1_Check_Teleport2",
                DelayFrame          = 140,
            },

            -- 텔레포트(타겟에서 도망치기)
            {
                AICheckFrame        = 10,
                AIFunc              = "Thanatos1_Check_Teleport",
                DelayFrame          = 190,
            },
*/--]]
        },
    },
    
    -- 근접공격01
    {
        ID      = "ATTACK01",
        Motion  = "Thanatos1_Attack01.frm",
        Func    = "Thanatos1_Attack01Func",
    },
    
    -- 깃털공격02
    {
        ID      = "ATTACK02",
        Motion  = "Thanatos1_Wait.frm",
        Func    = "Thanatos1_Attack02Func",
    },
    
    -- 깃털공격02
    {
        ID      = "ATTACK03",
        Motion  = "Thanatos1_Attack03.frm",
        Func    = "Thanatos1_Attack03Func",
    },
    
    -- 
    {
        ID      = "ATTACK04_RR",
        Motion  = "Thanatos1_attack04_left_back.frm",
        Func    = "Thanatos1_Attack04LFunc",
    },
    
    -- 
    {
        ID      = "ATTACK04_RL",
        Motion  = "Thanatos1_attack04_right_back.frm",
        Func    = "Thanatos1_Attack04RFunc",
    },
    
    -- 
    {
        ID      = "ATTACK04_LR",
        Motion  = "Thanatos1_attack04_left.frm",
        Func    = "Thanatos1_Attack04RFunc",
    },
    
    -- 
    {
        ID      = "ATTACK04_LL",
        Motion  = "Thanatos1_attack04_right.frm",
        Func    = "Thanatos1_Attack04LFunc",
    },
    
    -- 데미지
    {
        ID      = "DAMAGE",
        Motion  = "Thanatos1_damage.frm",
        Func    = "Thanatos1_DamageFunc",
    },
    
    -- 죽기착지
    {
        ID      = "DIE_LANDING",
        Motion  = "Thanatos1_change.frm",
        Func    = "Thanatos1_DieLandingFunc",
    },
    
    -- 텔레포트
    {
        ID      = "TELEPORT",
        Motion  = "Thanatos1_wait.frm",
        Func    = "Thanatos1_TeleportFunc",
        
        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 10,
                AIFunc              = "Thanatos1_Check_TeleportLanding",
                DelayFrame          = 10,
            },
        }
    },
    
    -- 텔레포트 착지
    {
        ID      = "TELEPORT_LANDING",
        Motion  = "Thanatos1_wait.frm",
        Func    = "Thanatos1_TeleportLandingFunc",
    },
    
    {
        ID      = "STUN",
        Motion  = "Thanatos1_Wait.frm",
        Func    = "Thanatos1_StunFunc",
    }
}

CallBack =
{
    Land    = "OnThanatos1_Land",
    --Die     = "OnThanatos1_Die",
    Damage  = "OnThanatos1_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitThanatos1( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE" )

    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE" )
    
    pMonster:SetFly( true )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Thanatos1_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:ToggleRender( true )
	pMonster:SetPushCheck( true )
	pMonster:SetInvincible( false )
		
	if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 대기 상태
function Thanatos1_StunFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:InitTimer()
		pMonster:StartTimer()
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		if( pMonster:GetTimer() > 275 ) then
			pMonster:SetState( "WAIT" )
			pMonster:InitTimer()
		else
			pMonster:SetFrameLock( true )
		end
    end
end

-- 죽기상태
function Thanatos1_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:PlaySound( 995041 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 죽기착지상태
function Thanatos1_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 60 ) then
		pMonster:AddParticleNoDirection( "Victor_Res_01", 0.0, 0.3)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function Thanatos1_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * 19.0 / 20.0 )
	pMonster:SetSpeedY( pMonster:GetSpeedY() * 19.0 / 20.0 )
	
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Thanatos1_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 60 ) then
		pMonster:AddDamage(DT_THANATOS1_HEADUP)
	elseif( iFrame == 65 ) then
		pMonster:PlaySound(995001)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  눈빛
function Thanatos1_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 2 ) then
		pMonster:AddParticle("Thanatos_Eyelight_01", 0.0, 0.5 )
		pMonster:AddParticle("Thanatos_Eyelight_02", 0.0, 0.5 )
		pMonster:PlaySound(995002)
	elseif( iFrame == 50 ) then
		local fRand = pMonster:FloatRand()
		local fDistX = 0.2

		fDistX = 0.1
		if( pMonster:GetTargetIsRight() == true ) then
			pMonster:SetX( pMonster:GetTargetX() - fDistX )
		else
			pMonster:SetX( pMonster:GetTargetX() + fDistX )
		end
		
		pMonster:SetY( pMonster:GetTargetY() + 0.1 )		
		pMonster:SetState( "TELEPORT" )
		pMonster:ResetDelay()
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 
function Thanatos1_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 81 ) then
		pMonster:SetTarget( 0, -1600, 1000, 1600, -1000 )
		local posx = pMonster:GetTargetX()
		local posy = pMonster:GetTargetY()
		pMonster:AddDamageWithLocate(DT_THANATOS1_FINGERUP, posx, posy, true)
		pMonster:PlaySound(995040)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 
function Thanatos1_Attack04RFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 90 ) then
		pMonster:PlaySound(995004)
		pMonster:AddDamage(DT_THANATOS1_STRACHING_ARM_R)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 
function Thanatos1_Attack04LFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 90 ) then
		pMonster:PlaySound(995004)
		pMonster:AddDamage(DT_THANATOS1_STRACHING_ARM_L)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Thanatos1_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -1600, 1000, 1600, -1000 ) == true ) then
		pMonster:TurnToTarget()
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
        pMonster:ResetDelay()
    end
end

function Thanatos1_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Thanatos1_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Thanatos1_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 0, -220, 220, 220, -140 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Thanatos1_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 0, -220, 220, 220, -140 ) == false ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function Thanatos1_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 0, -2000, 2000, 2000, -1000 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function Thanatos1_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:FloatRand() < 0.5 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		if( pMonster:GetIsRight() ) then
			if( pMonster:FloatRand() < 0.5 ) then
				pMonster:SetState( "ATTACK04_RR" )
			else
				pMonster:SetState( "ATTACK04_RL" )
			end
		else
			if( pMonster:FloatRand() < 0.5 ) then
				pMonster:SetState( "ATTACK04_LR" )
			else
				pMonster:SetState( "ATTACK04_LL" )
			end
		end
		pMonster:ResetDelay()
    end
end

function Thanatos1_Check_Teleport( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 0, -300, 350, 300, -300 ) == true ) then
		if( pMonster:GetIsRight() == true ) then
			if( pMonster:GetX() <= 0.5 ) then
				pMonster:SetX( pMonster:GetTargetX() + 1.2 )
				pMonster:TurnToTarget()
			else
				pMonster:SetX( pMonster:GetTargetX() - 1.2 )
			end
		else
			if( pMonster:GetX() <= 3.2 ) then
				pMonster:SetX( pMonster:GetTargetX() + 1.2 )
			else
				pMonster:SetX( pMonster:GetTargetX() - 1.2 )
				pMonster:TurnToTarget()
			end
		end
		
		pMonster:SetCountValue( 4 )
		pMonster:SetY( pMonster:GetTargetY() + 0.1 )		
		pMonster:SetState( "TELEPORT" )
		pMonster:ResetDelay()
    end
end

function Thanatos1_Check_TeleportLanding( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	pMonster:TurnToTarget()
	pMonster:SetState( "TELEPORT_LANDING" )
	pMonster:ResetDelay()	
end

function Thanatos1_Check_Teleport2( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 100, -500, 260, 500, -240 ) == false ) then
		local fRand = pMonster:FloatRand()
		local fDistX = 0.2

		if ( fRand < 0.5 ) then			
			fDistX = 0.2
			if( pMonster:GetTargetIsRight() == true ) then
				pMonster:SetX( pMonster:GetTargetX() - fDistX )
			else
				pMonster:SetX( pMonster:GetTargetX() + fDistX )
			end
			
			pMonster:SetCountValue( 1 )
			
		elseif ( fRand <= 1.0 ) then
			fDistX = 0.7
			if( pMonster:FloatRand() < 0.5 ) then
				pMonster:SetX( pMonster:GetTargetX() - fDistX )
			else
				pMonster:SetX( pMonster:GetTargetX() + fDistX )
			end
			
			pMonster:SetCountValue( 2 )
			
		elseif ( fRand < 1.0 ) then		-- 딜단 현재 안들어오게 함
			fDistX = 0.3
			if( pMonster:FloatRand() < 0.5 ) then
				pMonster:SetX( pMonster:GetTargetX() - fDistX )
			else
				pMonster:SetX( pMonster:GetTargetX() + fDistX )
			end
			
			pMonster:SetCountValue( 3 )		
		end
		
		pMonster:SetY( pMonster:GetTargetY() + 0.1 )		
		pMonster:SetState( "TELEPORT" )
		pMonster:ResetDelay()
    end
end

--  텔레포트 상태
function Thanatos1_TeleportFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:ToggleRender( false )
		pMonster:SetPushCheck( false )
		pMonster:SetInvincibleFrame( pMonster:GetLastFrame() + 10 )
		pMonster:AddParticle( "Thanatos_Warp_01", 0.0, -0.34 )
		pMonster:AddParticle( "Thanatos_Warp_02", 0.0, -0.34 )
		pMonster:PlaySound( "995026" )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  텔레포트 착지 상태
function Thanatos1_TeleportLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:AddParticle( "Thanatos_Warp_01", 0.0, -0.34 )
		pMonster:AddParticle( "Thanatos_Warp_02", 0.0, -0.34 )
		pMonster:PlaySound( "995026" )
    elseif( iFrame == 6 ) then
		pMonster:ToggleRender( true )
		pMonster:SetPushCheck( true )
		pMonster:SetInvincible( false )
		pMonster:AddDamage(DT_THANATOS1_HEADUP)
		pMonster:PlaySound(995001)
		pMonster:SetState( "WAIT" )
		pMonster:SetCountValue(0)
    end
end
-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnThanatos1_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
end

function OnThanatos1_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:TurnToTarget()	
	pMonster:SetPushCheck( false )
	pMonster:SetFly( false )
	pMonster:SetNoCheckContact( 15 )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.02 )
	pMonster:SetState( "DIE_LANDING" )
end

function OnThanatos1_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetPushCheck( true )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	
	if ( pMonster:FloatRand() < 0.10 ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK03" )
	end
end
