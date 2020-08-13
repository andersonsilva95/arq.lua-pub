-- AI_Talin_Pollguard_Man.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Talin_TH_Wait.frm",
        Func    = "Talin_Pollguard_Man_WaitFunc",
        
        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 1,
                AIFunc              = "Talin_Pollguard_Man_Check_1stTargeting",
                DelayFrame          = 99999999999,
            },
            
			-- 타게팅
            {
                AICheckFrame        = 3,
                AIFunc              = "Talin_Pollguard_Man_Check_Targeting",
                DelayFrame          = 1,
            },
		},
    },
        
    -- 근접공격
    {
        ID      = "ATTACK01",
        Motion  = "Talin_TH_Attack.frm",
        Func    = "Talin_Pollguard_Man_Attack01Func",

		Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 1,
                AIFunc              = "Talin_Pollguard_Man_Check_Stop",
                DelayFrame          = 1,
            },
		},
    },

    -- 데미지 중
    {
        ID      = "DAMAGE",
        Motion  = "Talin_TH_Damage.frm",
        Func    = "Talin_Pollguard_Man_DamageFunc",
        
        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 1,
                AIFunc              = "Talin_Pollguard_Man_Check_Down",
                DelayFrame          = 1,
            },
		},
    },
    
    -- 데미지 중
    {
        ID      = "DIE",
        Motion  = "Talin_TH_Damage.frm",
        Func    = "Talin_Pollguard_Man_DieFunc",
    },

    {
        ID      = "DOWN",
        Motion  = "Talin_TH_Down.frm",
        Func    = "Talin_Pollguard_Man_DropDownFunc",
        IsFallDownMotion    = TRUE,
    },

    {
        ID      = "LANDING",
        Motion  = "Talin_TH_Landing.frm",
        Func    = "Talin_Pollguard_Man_LandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
     -- 죽기 착지
    {
        ID      = "SURPRISE",
        Motion  = "Talin_TH_Surprise.frm",
        Func    = "Talin_Pollguard_Man_AtkReadyFunc",
    },
}

CallBack =
{
    Land    = "OnTalin_Pollguard_Man_Land",
    Die     = "OnTalin_Pollguard_Man_Die",
    Damage  = "OnTalin_Pollguard_Man_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitTalin_Pollguard_Man( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE" )
    
    pMonster:SetCountValue(0)
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Talin_Pollguard_Man_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 떨어짐
function Talin_Pollguard_Man_DropDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSuperArmor( true )
	--pMonster:SetInvincible( true )

    if( iFrame <= 1 ) then
		--pMonster:SetInvincible( true )
		
		pMonster:SetFly(false)
		pMonster:SetSpeedY(-0.05)
		pMonster:SetSpeedX(0.0)
		pMonster:SetX(1.5)
		pMonster:SetY(10.0)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DOWN" )
    end
end

-- 착지~
function Talin_Pollguard_Man_LandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSuperArmor( true )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetPushCheck( true )
        pMonster:SetState( "ATTACK01" )
    end
end

-- 데미지 입은거
function Talin_Pollguard_Man_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 1 ) then
		local speedx = -0.05
		if( pMonster:GetIsRight() == false ) then
			speedx = speedx * -1.0
		end
		pMonster:SetSpeedX(speedx)
		pMonster:SetSpeedY(0.05)
		pMonster:SetFly(true)
		pMonster:InitTimer()
		pMonster:StartTimer()
        pMonster:SetInvincible( true )
        --pMonster:PlaySound(987024)
        
        pMonster:AddCountValue(1)
        if( pMonster:GetCountValue() == 3 ) then
			pMonster:StartText("TALIN")
			pMonster:AddDamage(DT_TALIN_TH_BUFF)
		end
	end

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( false )
    end
end

-- 데미지 입은거
function Talin_Pollguard_Man_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 1 ) then
		local speedx = -0.05
		if( pMonster:GetIsRight() == false ) then
			speedx = speedx * -1.0
		end
		pMonster:SetSpeedX(speedx)
		pMonster:SetSpeedY(0.05)
		pMonster:SetFly(true)
		pMonster:InitTimer()
		pMonster:StartTimer()
        pMonster:SetInvincible( true )
        pMonster:PlaySound(987024)
	end

    if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()
        pMonster:SetFrameLock( false )
    end
end

--  근접공격 상태
function Talin_Pollguard_Man_AtkReadyFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:TurnToTarget()
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "ATTACK01" )
    end
end

--  근접공격 상태
function Talin_Pollguard_Man_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX(pMonster:GetRunSpeed() )
    
    if( math.mod(iFrame, 20 ) == 0 ) then
		pMonster:TurnToTarget()
		pMonster:AddTraceParticleToBone( "Larva_Scratch", 1.0, -1, 8, 8, 0.0, 0.0, false )
    end
    
    if( iFrame <= 1 ) then
		pMonster:TurnToTarget()
	elseif( iFrame == 15 ) then
		pMonster:AddDamage(DT_TALIN_TH_ATK)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "ATTACK01" )
    end
end


--  점프 상태
function Talin_Pollguard_Man_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  스톤커스 걸렸음
function Talin_Pollguard_Man_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "StoneCurse_small", 3 )
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
        pMonster:SetInvincible( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_LANDING" )
		end
    end
end

--  아이스커스 걸렸음
function Talin_Pollguard_Man_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "IceCurse_small", 3 )
        pMonster:AddParticle( "IceCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "IceCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_small_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_LANDING" )
		end
    end
end


-- 홀드 걸렸음(이펙트)
function Talin_Pollguard_Man_HoldFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor(true)
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_01_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_02_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_03_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_04_Small", 0.0, 0.12 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSuperArmor( false )
		pMonster:SetState( "WAIT" )
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_LANDING" )
		end
	end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Talin_Pollguard_Man_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == false ) then
	    if( pMonster:SetTarget( 0, -900, 400, 900, -50 ) == true ) then
			pMonster:TurnToTarget()
			pMonster:SetState("ATTACK01")
	        pMonster:ResetDelay()
	    end
	end
end

function Talin_Pollguard_Man_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 0, -900, 400, 900, -50 ) == false ) then
		pMonster:TurnToTarget()
		pMonster:SetState("WAIT")
        pMonster:ResetDelay()
    end

end

function Talin_Pollguard_Man_Check_1stTargeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -900, 320, 900, -100 ) == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState("SURPRISE")
        pMonster:ResetDelay()
    end  
end

function Talin_Pollguard_Man_Check_Down( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetTimer() > 1650 ) then
	--if( pMonster:GetTimer() > 110 ) then		-- 테스트용
		pMonster:TurnToTarget()
		pMonster:SetState("DOWN")
        pMonster:ResetDelay()
    end
end

function Talin_Pollguard_Man_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 200, -600, 500, 600, -300 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Talin_Pollguard_Man_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Talin_Pollguard_Man_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnTalin_Pollguard_Man_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "DOWN" ) == true ) then
        pMonster:SetState( "LANDING" )
    end   
end

function OnTalin_Pollguard_Man_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_LANDING" )
end

function OnTalin_Pollguard_Man_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:PlaySound(987024)
    pMonster:SetPushCheck( false )
end

function Talin_Pollguard_Man_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 4.9))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function Talin_Pollguard_Man_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.2) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.038 )			
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.019 )			
		end
	end
end