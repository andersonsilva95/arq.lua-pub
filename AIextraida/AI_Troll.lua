-- AI_Troll.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Troll_Wait.frm",
        Func    = "Troll_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 25,
                AIFunc              = "Troll_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 220,
                AIFunc              = "Troll_Check_ReleaseTarget",
                DelayFrame          = 440,
            },
            -- 타겟을 향하여 돌기
            {
                AICheckFrame        = 80,
                AIFunc              = "Troll_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- 3단공격
            {
                AICheckFrame        = 250,
                AIFunc              = "Troll_Check_Attack01",
                DelayFrame          = 250,
            },
            
            -- 돌진공격
            {
                AICheckFrame        = 200,
                AIFunc              = "Troll_Check_Attack02",
                DelayFrame          = 220,
            },
            -- 점프공격
            {
                AICheckFrame        = 440,
                AIFunc              = "Troll_Check_JumpAttack",
                DelayFrame          = 440,
            },
        },
    },
    
    -- 점프공격
    {
        ID      = "JUMPATTACK",
        Motion  = "Troll_JumpAttack.frm",
        Func    = "Troll_JumpAttackFunc",

        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Troll_Process_Jump",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 점프공격 착지할때..
    {
        ID      = "JUMPATTACK_LANDING",
        Motion  = "Troll_JumpAttack_Landing.frm",
        Func    = "Troll_JumpAttackLandingFunc",
    },

    -- 삼단치기
    {
        ID      = "ATTACK01",
        Motion  = "Troll_Attack01.frm",
        Func    = "Troll_Attack01Func",
    },

    -- 돌진공격
    {
        ID      = "ATTACK02",
        Motion  = "Troll_Attack02.frm",
        Func    = "Troll_Attack02Func",
    },

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "Troll_Damage_Up.frm",
        Func    = "Troll_DamageFunc",
    },
    
    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Troll_Damage_Up.frm",
        Func    = "Troll_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Troll_Damage_Down.frm",
        Func    = "Troll_DamageFunc",
    },
    
    -- 다운 상01
    {
        ID      = "DOWN_UP01",
        Motion  = "Troll_Down_Up01.frm",
        Func    = "Troll_DownUp01Func",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Troll_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 상02
    {
        ID      = "DOWN_UP02",
        Motion  = "Troll_Down_Up02.frm",
        Func    = "Troll_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
    
    -- 다운 상 착지
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "Troll_Down_Up03.frm",
        Func    = "Troll_DownUp03Func",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Troll_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
     -- 다운 스페셜 
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "Troll_Down_Special.frm",
        Func    = "Troll_DownFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "Troll_StandUp.frm",
        Func    = "Troll_StandUpFunc",
    },

    -- 죽기01
    {
        ID      = "DIE01",
        Motion  = "Troll_Die01.frm",
        Func    = "Troll_DieFunc",
    },
    
    -- 죽기02
    {
        ID      = "DIE02",
        Motion  = "Troll_Die02.frm",
        Func    = "Troll_DieFunc",
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "Troll_Stone.frm",
        Func    = "Troll_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "Troll_Stone.frm",
        Func    = "Troll_IceCurseFunc",
    },
    
    -- 홀드상태
    {
        ID      = "HOLD",
        Motion  = "Troll_Stone.frm",
        Func    = "Troll_HoldFunc",
    },
}

CallBack =
{
    Land    = "OnTroll_Land",
    Die     = "OnTroll_Die",
    Damage  = "OnTroll_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitTroll( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DOWN_UP01" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DOWN_SPECIAL" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
	pMonster:RegistReaction( ATTACKTYPE_HOLD, ATTACKDIR_NORMAL,   "HOLD" )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Troll_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function Troll_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "MOVE" )
    end

end

-- 점프 상태
function Troll_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
        pMonster:TurnToTarget()
        pMonster:StartText( "JUMP" )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 점프착지
function Troll_JumpLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 점프 상태
function Troll_JumpAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
        pMonster:TurnToTarget()
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 착지하면서 지진
function Troll_JumpAttackLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 3 ) then
        pMonster:StartAttack( 4, PAR_FRONTDOWN_2, 0.0 )
    elseif( iFrame == 5 ) then
        pMonster:EndAttack()
    elseif( iFrame == 6 ) then
        pMonster:PlaySound( "47", 0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 삼단치기 상태
function Troll_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame >= 1 and iFrame < 11 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 0.5 )	    
	elseif( iFrame == 12 ) then
		pMonster:SkillReadyEffectNoStop(255, 255, 255, 0.0)
	elseif( iFrame >= 26 and iFrame < 33 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.0 )
		if( iFrame == 32 ) then
			pMonster:AddDamage( DT_MONSTER_TROLL01_01 )
		end
	elseif( iFrame >= 56 and iFrame < 58 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -0.5 )
		if( iFrame == 56 ) then
			pMonster:AddDamage( DT_MONSTER_TROLL01_01 )
		end
	elseif( iFrame >= 83 and iFrame < 88 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
	elseif( iFrame == 90 ) then
		pMonster:AddDamage( DT_MONSTER_TROLL01_02 )
	elseif( iFrame >= 101 and iFrame < pMonster:GetLastFrame() ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -0.2 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 돌진공격 상태
function Troll_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
        pMonster:TurnToTarget()
    elseif( iFrame >= 33 and iFrame < 73 ) then
		pMonster:SetSpeedX( pMonster:GetRunSpeed() )
	elseif( iFrame == 73 ) then
		pMonster:AddDamage( DT_MONSTER_TROLL02 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 죽었음
function Troll_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1) then
        pMonster:SetInvincible( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function Troll_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다운 상
function Troll_DownUp01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상2
function Troll_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상3
function Troll_DownUp03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 5 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )                
        
        if( pMonster:GetHP() <= 0 ) then
            pMonster:SetState( "DIE02" )
        end        
    end
end

-- 일어나기
function Troll_StandUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1) then
		pMonster:SetPushCheck( true )
	        pMonster:SetSuperArmor( true )
        	pMonster:SetInvincibleFrame( pMonster:GetLastFrame() + 20 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
    end
end

--  스톤커스 걸렸음
function Troll_StoneCurseFunc( iMonsterIndex, iFrame )
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
			pMonster:SetState( "DIE01" )
		end
    end
end

--  아이스커스 걸렸음
function Troll_IceCurseFunc( iMonsterIndex, iFrame )
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
			pMonster:SetState( "DIE" )
		end
    end
end

--  홀드 걸렸음
function Troll_HoldFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
        pMonster:AddParticle( "Arme01_Hold_Beam_effect_01_Big", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_02_Big", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_03_Big", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_04_Big", 0.0, 0.12 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then       
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end



-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------
function Troll_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Troll_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -1100, 900, 1100, -900 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Troll_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Troll_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 180, -180, 150, 180, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Troll_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 300, -200, 150, 200, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function Troll_Check_JumpAttack( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true ) then
		pMonster:AddCountValue(1)
        pMonster:SetState( "JUMPATTACK" )
        pMonster:ResetDelay()
    end
end

function Troll_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 300, -100, 150, 100, -200 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function Troll_Check_FireBreath( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 500, -300, 140, 300, -190 ) == true and pMonster:GetCountValue() >= 5 ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "SPECIAL_ATTACK" )
		pMonster:ResetDelay()
    end
end

function Troll_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		pMonster:SetState( "Attack04" )
		pMonster:ResetDelay()
    end
end

function Troll_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
        pMonster:SetState( "DOWN_UP02" )
    end
end

function Troll_Process_Jump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    --pMonster:SetPushCheck( false )

    if( iFrame == 33 ) then
        pMonster:SetNoCheckContact( 66 )

        iTargetX = pMonster:GetTargetX()
        iTargetY = pMonster:GetTargetY()
        iX       = pMonster:GetX()
        iY       = pMonster:GetY()

        pMonster:SetSpeedX( ( iTargetX - iX ) / 80.0 )

        if( iTargetY - iY >= -0.25 ) and ( iTargetY - iY < 0.25 ) then
            pMonster:SetSpeedY( 0.061 )   -- 동일 y선상에 있을때 이정도가 적당..
        elseif( iTargetY - iY >= 0.25 ) and ( iTargetY - iY < 0.5 ) then
            pMonster:SetSpeedY( 0.066 )   -- 타겟이 조금 높은곳에 있으면..
        elseif( iTargetY - iY >= -0.5 ) and ( iTargetY - iY < -0.25 ) then
            pMonster:SetSpeedY( 0.050 )    -- 타겟이 조금 낮은곳에 있으면..
        elseif( iTargetY - iY >= 0.5 ) then
            pMonster:SetSpeedY( 0.071 )
        elseif( iTargetY - iY < -0.5 ) then
            pMonster:SetSpeedY( 0.042 )
        end

        pMonster:TurnToTarget()
     elseif( iFrame > 60 ) then
		if( pMonster:GetSpeedY() < 0.1 ) then
			pMonster:SetSpeedY( pMonster:GetSpeedY() - 0.001 )
		end
     end
end

function Troll_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
        pMonster:SetState( "STANDUP" )
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnTroll_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckState( "JUMP" ) == true ) then
        pMonster:SetState( "JUMP_LANDING" )
        pMonster:SetSpeedX( pMonster:GetSpeedX() * 0.65 )
    elseif( pMonster:CheckState( "JUMPATTACK" ) == true ) then
        pMonster:SetState( "JUMPATTACK_LANDING" )
        pMonster:SetSpeedX( pMonster:GetSpeedX() * 0.65 )
    elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then
        pMonster:SetDownDelay( 50 + (pMonster:FloatRand() * 50) )
        pMonster:SetState( "DOWN_UP_LANDING" )
    end
end

function OnTroll_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if(  pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_UP_LANDING" ) == false ) then
		pMonster:SetState( "DIE01" )
	else
		pMonster:SetState( "DIE02" )
	end
end

function OnTroll_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetPushCheck( true )
    pMonster:SetNoCheckContact(0)
    pMonster:SetSpeedX( 2.0 * pMonster:GetSpeedX() / 3.0 )
    pMonster:SetSpeedY( 2.0 * pMonster:GetSpeedY() / 3.0 )
    
    if( pMonster:CheckPreState( "DOWN_UP01" ) == true or pMonster:CheckPreState( "DOWN_UP02") == true ) then
		if( pMonster:CheckState( "DAMAGE_UP" ) or pMonster:CheckState( "DOWN_UP01" )) then
			pMonster:SetSpeedY( 0.028 )
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DAMAGE_MIDDLE" ) or pMonster:CheckState( "DOWN_MIDDLE" ) or pMonster:CheckState( "DAMAGE_DOWN" ) ) then
			pMonster:SetSpeedX( pMonster:GetSpeedX() / 2 )
			pMonster:SetSpeedY( 0.019 )			
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DOWN_DOWN" )) then
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -2.0 )
			pMonster:SetSpeedY( -0.04 )			
			pMonster:SetState( "DOWN_UP02" )		
			pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )			
		end	
	end
	
    if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false ) then
		if( pMonster:FloatRand() < 0.03 and pMonster:GetIsContact() == true ) then    
			pMonster:AddCountValue(1)		
			if( pMonster:FloatRand() < 0.5) then
				pMonster:SetState( "ATTACK02" )
			else
				pMonster:SetState( "JUMPATTACK" )
			end		
		end
	end
end