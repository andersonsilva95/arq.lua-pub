-- AI_Tunnel_Dinergete.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Tunnel_Dinergate_wait.frm",
        Func    = "Tunnel_Dinergate_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 40,
                AIFunc              = "Tunnel_Dinergate_Check_Targeting",
                DelayFrame          = 60,
            },

            -- 타겟지움
            {
                AICheckFrame        = 250,
                AIFunc              = "Tunnel_Dinergate_Check_ReleaseTarget",
                DelayFrame          = 200,
            },

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 30,
                AIFunc              = "Tunnel_Dinergate_Check_TurnToTarget",
                DelayFrame          = 20,
            },

            -- 걷기
            {
                AICheckFrame        = 30,
                AIFunc              = "Tunnel_Dinergate_Check_Walk",
                DelayFrame          = 30,
            },

            -- 점프업
            {
                AICheckFrame        = 42,
                AIFunc              = "Tunnel_Dinergate_Check_JumpUp",
                DelayFrame          = 30,
            },        
            -- 점프다운
            {
                AICheckFrame        = 41,
                AIFunc              = "Tunnel_Dinergate_Check_JumpDown",
                DelayFrame          = 20,
            },

            -- 어슬렁대기(이동)
            {
                AICheckFrame        = 110,
                AIFunc              = "Tunnel_Dinergate_Check_Idle",
                DelayFrame          = 150,
            },

			-- 가드 슬래쉬
            --{
                --AICheckFrame        = 80,
                --AIFunc              = "Tunnel_Dinergate_Check_Attack01",
                --DelayFrame          = 200,
            --},

            -- 어퍼컷 스피어
            {
            	AICheckFrame        = 15,
            	AIFunc              = "Tunnel_Dinergate_Check_Attack02",
            	DelayFrame          = 150,
            },

            -- 크로스 스피어
            {
                AICheckFrame        = 15,
                AIFunc              = "Tunnel_Dinergate_Check_Attack03",
                DelayFrame          = 150,
            },

        },
    },

    -- 이동
    {
        ID              = "WALK",
        Motion          = "Tunnel_Dinergate_walk.frm",
        Func            = "Tunnel_Dinergate_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Tunnel_Dinergate_MoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 55,
                AIFunc              = "Tunnel_Dinergate_Check_Targeting",
                DelayFrame          = 77,
            },
            -- 타겟지움
            {
                AICheckFrame        = 200,
                AIFunc              = "Tunnel_Dinergate_Check_ReleaseTarget",
                DelayFrame          = 200,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 20,
                AIFunc              = "Tunnel_Dinergate_Check_TurnToTarget",
                DelayFrame          = 20,
            },
            -- 점프업
            {
                AICheckFrame        = 32,
                AIFunc              = "Tunnel_Dinergate_Check_JumpUp",
                DelayFrame          = 30,
            },        
            -- 점프다운
            {
                AICheckFrame        = 31,
                AIFunc              = "Tunnel_Dinergate_Check_JumpDown",
                DelayFrame          = 20,
            },
			-- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "Tunnel_Dinergate_Check_Stop",
                DelayFrame          = 50,
            },
        }
    },
    
     -- 어슬렁대기
    {
        ID              = "IDLE",
        Motion          = "Tunnel_Dinergate_walk.frm",
        Func            = "Tunnel_Dinergate_IdleFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Tunnel_Dinergate_IdleMoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 40,
                AIFunc              = "Tunnel_Dinergate_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 어슬렁대기(멈춤)
            {
                AICheckFrame        = 220,
                AIFunc              = "Tunnel_Dinergate_Check_Idle_Stop",
                DelayFrame          = 100,
            },
        }
    },
        
    -- 근접공격
    {
        ID      = "ATTACK01",
        Motion  = "Tunnel_Dinergate_Attack01.frm",
        Func    = "Tunnel_Dinergate_Attack01Func",
    },
    
    -- 근접공격
    {
        ID      = "ATTACK02",
        Motion  = "Tunnel_Dinergate_Attack02.frm",
        Func    = "Tunnel_Dinergate_Attack02Func",
    },
    
    -- 근접공격
    {
        ID      = "ATTACK03",
        Motion  = "Tunnel_Dinergate_Attack03.frm",
        Func    = "Tunnel_Dinergate_Attack03Func",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "Tunnel_Dinergate_Jump_Up.frm",
        Func    = "Tunnel_Dinergate_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "Tunnel_Dinergate_Jump_Down.frm",
        Func    = "Tunnel_Dinergate_JumpDownFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "Tunnel_Dinergate_Jump_Landing.frm",
        Func    = "Tunnel_Dinergate_ToWait",
    },

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "Tunnel_Dinergate_Damage_Up.frm",
        Func    = "Tunnel_Dinergate_DamageFunc",
    },
    
    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Tunnel_Dinergate_Damage_Middle.frm",
        Func    = "Tunnel_Dinergate_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Tunnel_Dinergate_Damage_Down.frm",
        Func    = "Tunnel_Dinergate_DamageFunc",
    },

    -- 다운 상
    {
        ID      = "DOWN_UP01",
        Motion  = "Tunnel_Dinergate_Down_Up01.frm",
        Func    = "Tunnel_Dinergate_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Tunnel_Dinergate_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 상02
    {
        ID      = "DOWN_UP02",
        Motion  = "Tunnel_Dinergate_Down_Up02.frm",
        Func    = "Tunnel_Dinergate_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
	
	-- 다운 상 착지
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "Tunnel_Dinergate_Down_Up03.frm",
        Func    = "Tunnel_Dinergate_DownUp03Func",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Tunnel_Dinergate_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
	
    -- 다운 중
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "Tunnel_Dinergate_Down_Middle.frm",
        Func    = "Tunnel_Dinergate_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Tunnel_Dinergate_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 하
    {
        ID      = "DOWN_DOWN",
        Motion  = "Tunnel_Dinergate_Down_Middle.frm",
        Func    = "Tunnel_Dinergate_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Tunnel_Dinergate_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 스페셜
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "Tunnel_Dinergate_Down_Special01.frm",
        Func    = "Tunnel_Dinergate_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 다운 스페셜 착지
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "Tunnel_Dinergate_Down_Special02.frm",
        Func    = "Tunnel_Dinergate_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Tunnel_Dinergate_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },

    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "Tunnel_Dinergate_down_middle.frm",
        Func    = "Tunnel_Dinergate_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "Tunnel_Dinergate_Standup.frm",
        Func    = "Tunnel_Dinergate_StandupFunc",
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "Tunnel_Dinergate_stone.frm",
        Func    = "Tunnel_Dinergate_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "Tunnel_Dinergate_stone.frm",
        Func    = "Tunnel_Dinergate_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "Tunnel_Dinergate_stone.frm",
		Func	= "Tunnel_Dinergate_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnTunnel_Dinergate_Land",
    Die     = "OnTunnel_Dinergate_Die",
    Damage  = "OnTunnel_Dinergate_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitTunnel_Dinergete( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DOWN_UP01" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DOWN_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DOWN_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DOWN_SPECIAL" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Tunnel_Dinergate_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function Tunnel_Dinergate_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 어슬렁대기 상태
function Tunnel_Dinergate_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
end

-- 죽었음
function Tunnel_Dinergate_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DIE_LANDING" )
    end
end

-- 죽기 착지
function Tunnel_Dinergate_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(993007)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function Tunnel_Dinergate_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다운 상
function Tunnel_Dinergate_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상2
function Tunnel_Dinergate_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상3
function Tunnel_Dinergate_DownUp03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 5 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )		
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_LANDING" )
		end    		
    end
end

-- 다운 미들
function Tunnel_Dinergate_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )		
		
		
    end
    
    if( pMonster:GetHP() <= 0 ) then
		pMonster:SetState( "DIE_LANDING" )
	end
end

-- 다운 스페셜
function Tunnel_Dinergate_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- 다운 스페셜 착지
function Tunnel_Dinergate_DownSpecialLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_LANDING" )
		end 				
    end
end

-- 일어나기
function Tunnel_Dinergate_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Tunnel_Dinergate_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame == 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 59 ) then
		pMonster:AddDamageWithLocate( DT_TUNNEL_DINERGATE_GUARD_SLASH )
	elseif( iFrame == 62 ) then
		local posx = 0.2
		local posy = 0.2
		if ( false == pMonster:GetIsRight() ) then
			posx = posx * -1.0
			pMonster:AddTraceParticleToBone( "Dinergate_Cut_R", 1.0, -1, 8, 8, posx, posy )
		else
			pMonster:AddTraceParticleToBone( "Dinergate_Cut", 1.0, -1, 8, 8, posx, posy )
		end
		pMonster:PlaySound(993008)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  근접공격2 상태
function Tunnel_Dinergate_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	--elseif( iFrame == 25 ) then		-- // 창 회전 삭제
	--	pMonster:PlaySound(993009)
	elseif( iFrame == 62 ) then
		pMonster:AddDamage( DT_TUNNEL_DINERGATE_SPEAR )
	--elseif( iFrame == 66 ) then
		pMonster:PlaySound(993008)
		local posx = 0.0
		local posy = 0.0
		if ( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Dinergate_Upper_01", posx, posy)
			pMonster:AddParticleNoDirection("Dinergate_Upper_02", posx, posy)
			pMonster:AddParticleNoDirection("Dinergate_Upper_03", posx, posy)
		else
			posx = -0.2
			pMonster:AddParticleNoDirection("Dinergate_Upper_01_R", posx, posy)
			pMonster:AddParticleNoDirection("Dinergate_Upper_02_R", posx, posy)
			pMonster:AddParticleNoDirection("Dinergate_Upper_03_R", posx, posy)
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end


--  근접공격2 상태
function Tunnel_Dinergate_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	--elseif( iFrame == 25 ) then
	--	pMonster:PlaySound(993009)
	elseif( iFrame == 72 ) then
		pMonster:AddDamage( DT_TUNNEL_DINERGATE_SPECIAL_ATK )
	--elseif( iFrame == 78 ) then
		pMonster:PlaySound(993008)

		local posx = 0.400
		local posy = 0.154
		if ( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Dinergate_Spear_01", posx, posy)
			pMonster:AddParticleNoDirection("Dinergate_Spear_02", posx, posy)
			pMonster:AddParticleNoDirection("Dinergate_Spear_03", posx, posy)
		else
			posx = posx * -1.0
			pMonster:AddParticleNoDirection("Dinergate_Spear_01_R", posx, posy)
			pMonster:AddParticleNoDirection("Dinergate_Spear_02_R", posx, posy)
			pMonster:AddParticleNoDirection("Dinergate_Spear_03_R", posx, posy)
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  점프 상태
function Tunnel_Dinergate_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	 if( pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMP_DOWN")
		pMonster:SetFrameLock( false )
	end
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 다운 상태
function Tunnel_Dinergate_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 상태
function Tunnel_Dinergate_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  스톤커스 걸렸음
function Tunnel_Dinergate_StoneCurseFunc( iMonsterIndex, iFrame )
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
function Tunnel_Dinergate_IceCurseFunc( iMonsterIndex, iFrame )
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
function Tunnel_Dinergate_HoldFunc( iMonsterIndex, iFrame )
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

function Tunnel_Dinergate_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -350, 300, 350, -300 ) == true ) then
		pMonster:TurnToTarget()		
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end  
end

function Tunnel_Dinergate_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -500, 360, 500, -400 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Tunnel_Dinergate_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Tunnel_Dinergate_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 400, -200, 360, 200, -400 ) == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "WALK" )
		pMonster:ResetDelay()
	end
end

function Tunnel_Dinergate_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 40, -200, 360, 200, -400 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Tunnel_Dinergate_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function Tunnel_Dinergate_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 120, -120, 50, 120, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function Tunnel_Dinergate_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 120, -120, 180, 120, -100 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function Tunnel_Dinergate_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 150, -150, 50, 150, -100 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function Tunnel_Dinergate_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 200, -200, 360, 200, 80 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Tunnel_Dinergate_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function Tunnel_Dinergate_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -150, -100, 150, -400 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()
	end
end

function Tunnel_Dinergate_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-- 어슬렁대기..  방향 바꾸기 후 이동
function Tunnel_Dinergate_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- 어슬렁대는 중.. 멈추기
function Tunnel_Dinergate_Check_Idle_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false and pMonster:FloatRand() < 0.5 ) then
		pMonster:SetSpeedX( 0.0 )
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnTunnel_Dinergate_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then		
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_UP_LANDING" )    
	elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then		
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_SPECIAL_LANDING" )    
    end   
end

function OnTunnel_Dinergate_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_LANDING" )
end

function OnTunnel_Dinergate_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
    pMonster:SetPushCheck( true )
    
	if( pMonster:CheckState( "JUMP" ) == true and pMonster:IsSuperArmor() == false ) then
		pMonster:SetNoCheckContact( 5 )
	end
	
	if( pMonster:CheckState( "DOWN_MIDDLE" ) == true or pMonster:CheckState( "DOWN_DOWN" ) == true ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )		
	end
	
	if( pMonster:CheckPreState( "DOWN_UP01" ) == true or pMonster:CheckPreState( "DOWN_UP02") == true ) then
		pMonster:SetNoCheckContact( 25 )
		if( pMonster:CheckState( "DAMAGE_UP" )) then
			pMonster:SetSpeedX( pMonster:GetSpeedX() / 3 )
			pMonster:SetSpeedY( 0.024 )
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DOWN_UP01" )) then
			pMonster:SetSpeedY( 0.032 )
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DAMAGE_MIDDLE" ) or pMonster:CheckState( "DOWN_MIDDLE" )) then
			pMonster:SetSpeedX( pMonster:GetSpeedX() / 2 )
			pMonster:SetSpeedY( 0.02 )			
			pMonster:SetState( "DOWN_UP01" )
		elseif( pMonster:CheckState( "DAMAGE_DOWN" )) then
			pMonster:SetSpeedX( pMonster:GetSpeedX() / 2 )
			pMonster:SetSpeedY( 0.02 )			
			pMonster:SetState( "DOWN_UP01" )			
		elseif( pMonster:CheckState( "DOWN_DOWN" )) then
			if( pMonster:GetIsRight() == true) then
				pMonster:SetSpeedX( -0.025 )			
			else
				pMonster:SetSpeedX( 0.025 )			
			end
			pMonster:SetNoCheckContact( 5 )
			pMonster:SetSpeedY( -0.04 )			
			pMonster:SetState( "DOWN_MIDDLE" )		
			pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )			
		end	
	end
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
		if( pMonster:FloatRand() < 0.05 and pMonster:GetIsContact() == true and pMonster:IsSuperArmor() == false ) then
			pMonster:SetSuperArmor( true )
			pMonster:TurnToTarget()

			if( pMonster:FloatRand() < 0.5 ) then
				pMonster:SetState( "ATTACK02" )
			else
				pMonster:SetState( "ATTACK03" )
			end
		end
	end
end

function Tunnel_Dinergate_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 4.9))
	pMonster:AddCountValue(1)
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function Tunnel_Dinergate_MoveFail( iMonsterIndex )
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

function Tunnel_Dinergate_IdleMoveFail( iMonsterIndex )
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
