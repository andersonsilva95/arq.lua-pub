-- AI_BlackGorgos.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "RedGorgos_Wait.frm",
        Func    = "BlackGorgos_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 25,
                AIFunc              = "BlackGorgos_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 220,
                AIFunc              = "BlackGorgos_Check_ReleaseTarget",
                DelayFrame          = 440,
            },
            -- Ÿ���� ���Ͽ� ����
            {
                AICheckFrame        = 25,
                AIFunc              = "BlackGorgos_Check_TurnToTarget",
                DelayFrame          = 25,
            },
            -- 3�ܰ���
            {
                AICheckFrame        = 25,
                AIFunc              = "BlackGorgos_Check_Attack01",
                DelayFrame          = 55,
            },
            -- ��������
            {
                AICheckFrame        = 110,
                AIFunc              = "BlackGorgos_Check_Jump",
                DelayFrame          = 150,
            },
            -- �����ġ�����
            {
                AICheckFrame        = 110,
                AIFunc              = "BlackGorgos_Check_Attack03",
                DelayFrame          = 220,
            },            
            -- ���̾�극��
            {
                AICheckFrame        = 25,
                AIFunc              = "BlackGorgos_Check_FireBreath",
                DelayFrame          = 220,
            },
        },
    },

    -- ����
    {
        ID      = "JUMP",
        Motion  = "RedGorgos_Jump.frm",
        Func    = "BlackGorgos_JumpFunc",

        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "BlackGorgos_Process_Jump",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �������� �����Ҷ�..
    {
        ID      = "JUMP_LANDING",
        Motion  = "RedGorgos_Jump_Landing.frm",
        Func    = "BlackGorgos_JumpLandingFunc",
    },

    -- ���ġ��
    {
        ID      = "ATTACK01",
        Motion  = "RedGorgos_Attack01.frm",
        Func    = "BlackGorgos_Attack01Func",
    },

    -- �ҽ��
    {
        ID      = "ATTACK02",
        Motion  = "RedGorgos_Attack02.frm",
        Func    = "BlackGorgos_Attack02Func",
    },
    
    -- �����ġ��
    {
        ID      = "ATTACK03",
        Motion  = "RedGorgos_Attack03.frm",
        Func    = "BlackGorgos_Attack03Func",
    },
    
    -- ���̾�극��
    {
        ID      = "SPECIAL_ATTACK",
        Motion  = "RedGorgos_SpecialAttack.frm",
        Func    = "BlackGorgos_SpecialAttackFunc",
    },

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "RedGorgos_Damage_Up.frm",
        Func    = "BlackGorgos_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "RedGorgos_Damage_Middle.frm",
        Func    = "BlackGorgos_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "RedGorgos_Damage_Down.frm",
        Func    = "BlackGorgos_DamageFunc",
    },
    
    -- �ٿ� ��
    {
        ID                  = "DOWN_UP01",
        Motion              = "RedGorgos_Down_Up01.frm",
        Func                = "BlackGorgos_DownUp01Func",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "BlackGorgos_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��02
    {
        ID                  = "DOWN_UP02",
        Motion              = "RedGorgos_Down_Up02.frm",
        Func                = "BlackGorgos_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� �� ����
    {
        ID                  = "DOWN_UP_LANDING",
        Motion              = "RedGorgos_Down_Up03.frm",
        Func                = "BlackGorgos_DownUp03Func",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "BlackGorgos_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� �����
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "RedGorgos_Down_Up.frm",
        Func    = "BlackGorgos_DownSpecialFunc",
    },
    
    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "RedGorgos_Standup.frm",
        Func    = "BlackGorgos_StandupFunc",
    },

    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "RedGorgos_Die01.frm",
        Func    = "BlackGorgos_DieFunc",
    },
    
    -- �ױ� ����
    {
        ID                  = "DIE_LANDING",
        Motion              = "RedGorgos_Die02.frm",
        Func                = "BlackGorgos_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "RedGorgos_Stone.frm",
        Func    = "BlackGorgos_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "RedGorgos_Stone.frm",
        Func    = "BlackGorgos_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "RedGorgos_Stone.frm",
		Func	= "BlackGorgos_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnBlackGorgos_Land",
    Die     = "OnBlackGorgos_Die",
    Damage  = "OnBlackGorgos_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitBlackGorgos( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DOWN_UP01" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DOWN_SPECIAL" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )

end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function BlackGorgos_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ȱ� ����
function BlackGorgos_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "MOVE" )
    end

end

-- ���� ����
function BlackGorgos_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:TurnToTarget()
        pMonster:StartText( "JUMP" )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �����ϸ鼭 ����
function BlackGorgos_JumpLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 3 ) then
        pMonster:StartAttack( 15, PAR_BIG_DAMAGE, 0.0 )
    elseif( iFrame == 4 ) then
        pMonster:EarthQuake( 30, 0.06, 0.03 )
    elseif( iFrame == 5 ) then
        pMonster:EndAttack()
    elseif( iFrame == 6 ) then
        pMonster:PlaySound( "47" )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ���ġ�� ����
function BlackGorgos_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame < 20 ) then        
        pMonster:SetSpeedX( pMonster:GetRunSpeed() * 0.6 )
    elseif( iFrame == 51 ) then
        pMonster:AddDamage( DT_MONSTER_GORGOS01 )
    elseif( iFrame > 56 and iFrame < 72 ) then
		pMonster:SetSpeedX( pMonster:GetRunSpeed() )
    elseif( iFrame == 76 ) then
        pMonster:AddDamage( DT_MONSTER_GORGOS02 )
    elseif( iFrame > 86 and iFrame < 95 ) then
		pMonster:SetSpeedX( pMonster:GetRunSpeed() )
    elseif( iFrame == 106 ) then
        pMonster:AddDamage( DT_MONSTER_GORGOS03 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ҽ�� ����
function BlackGorgos_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:TurnToTarget()
        pMonster:StartText( "DANGER" )
        pMonster:PlaySound( "129" )
    elseif( iFrame == 59 ) then
        pMonster:PlaySound( "27" )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �����ġ�� ����
function BlackGorgos_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:TurnToTarget()
    elseif( iFrame >= 14 and iFrame < 38 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -0.76 )
    elseif( iFrame >= 64 and iFrame < 77 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 11.0 )
		
		if( iFrame == 64 ) then
			pMonster:AddDamage( DT_MONSTER_GORGOS04 )
		end
	elseif( iFrame == 77 ) then
		pMonster:SetSpeedX( pMonster:GetSpeedX() / 4.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �����ȯ ����
function BlackGorgos_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ���̾�극�� ����
function BlackGorgos_SpecialAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:TurnToTarget()
        pMonster:StartText( "DANGER" )
        pMonster:PlaySound( "129" )
    elseif( iFrame == 91 ) then
        pMonster:PlaySound( "27" )
    elseif( iFrame >= 111 and iFrame < 216 ) then        
    
		if( math.mod( iFrame, 5 ) == 0 ) then
			pMonster:AddDamage( DT_MONSTER_GORGOS05 )        
		end
		
		if( iFrame == 111 ) then
			pMonster:AddParticle("GORGOS_breath01", 0.45, 0.29 )
			pMonster:AddParticle("GORGOS_breath02", 0.45, 0.29 )
			pMonster:AddParticle("GORGOS_breath03", 0.80, 0.29 )
			pMonster:AddParticle("GORGOS_breath04", 0.65, 0.29 )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �׾���
function BlackGorgos_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function BlackGorgos_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ� ��
function BlackGorgos_DownUp01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��2
function BlackGorgos_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��3
function BlackGorgos_DownUp03Func( iMonsterIndex, iFrame )
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

-- �ٿ� ����� ����
function BlackGorgos_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame > 3 and iFrame < 57 ) then
		pMonster:SetSpeedX( pMonster:GetRunSpeed() * -0.8 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �Ͼ��
function BlackGorgos_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )        
    end
end

--  ����Ŀ�� �ɷ���
function BlackGorgos_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
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
			pMonster:SetState( "DIE" )
		end
    end
end

--  ���̽�Ŀ�� �ɷ���
function BlackGorgos_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
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

-- Ȧ�� �ɷ���(����Ʈ)
function BlackGorgos_HoldFunc( iMonsterIndex, iFrame )
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
			pMonster:SetState( "DIE" )
		end
	end
end

-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------
function BlackGorgos_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function BlackGorgos_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -1100, 900, 1100, -900 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function BlackGorgos_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function BlackGorgos_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, 100, 150, -150 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function BlackGorgos_Check_Jump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true ) then
		pMonster:AddCountValue(1)
        pMonster:SetState( "JUMP" )
        pMonster:ResetDelay()
    end
end

function BlackGorgos_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 300, -100, 150, 100, -200 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function BlackGorgos_Check_FireBreath( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 500, -300, 140, 300, -190 ) == true and pMonster:GetCountValue() >= 5 ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "SPECIAL_ATTACK" )
		pMonster:ResetDelay()
    end
end

function BlackGorgos_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		pMonster:SetState( "Attack04" )
		pMonster:ResetDelay()
    end
end

function BlackGorgos_Process_Jump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    --pMonster:SetPushCheck( false )

    if( iFrame == 44 ) then
        pMonster:SetNoCheckContact( 65 )

        iTargetX = pMonster:GetTargetX()
        iTargetY = pMonster:GetTargetY()
        iX       = pMonster:GetX()
        iY       = pMonster:GetY()

        pMonster:SetSpeedX( ( iTargetX - iX ) / 80.0 )

        if( iTargetY - iY >= -0.25 ) and ( iTargetY - iY < 0.25 ) then
            pMonster:SetSpeedY( 0.061 )   -- ���� y���� ������ �������� ����..
        elseif( iTargetY - iY >= 0.25 ) and ( iTargetY - iY < 0.5 ) then
            pMonster:SetSpeedY( 0.066 )   -- Ÿ���� ���� �������� ������..
        elseif( iTargetY - iY >= -0.5 ) and ( iTargetY - iY < -0.25 ) then
            pMonster:SetSpeedY( 0.050 )    -- Ÿ���� ���� �������� ������..
        elseif( iTargetY - iY >= 0.5 ) then
            pMonster:SetSpeedY( 0.071 )
        elseif( iTargetY - iY < -0.5 ) then
            pMonster:SetSpeedY( 0.042 )
        end

        pMonster:TurnToTarget()
     elseif( iFrame > 82 ) then
		if( pMonster:GetSpeedY() < 0.0 ) then
			pMonster:SetSpeedY( pMonster:GetSpeedY() - 0.0008 )
		end
     end
end

function BlackGorgos_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
        pMonster:SetState( "DOWN_UP02" )
    end
end


function BlackGorgos_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
        pMonster:SetState( "STANDUP" )
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnBlackGorgos_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckState( "JUMP" ) == true ) then
        pMonster:SetState( "JUMP_LANDING" )
        pMonster:SetSpeedX( pMonster:GetSpeedX() * 0.65 )
    elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then
		pMonster:SetState( "DOWN_UP_LANDING" )
		pMonster:SetSpeedX( pMonster:GetSpeedX() * 0.65 )
		pMonster:SetDownDelay( 50 + (pMonster:FloatRand() * 50) )
    end
end

function OnBlackGorgos_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:SetState( "DIE" )
	end
	
end

function OnBlackGorgos_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetPushCheck( true )
    pMonster:SetNoCheckContact(0)
    pMonster:SetSpeedX( 2.0 * pMonster:GetSpeedX() / 3.0 )
    pMonster:SetSpeedY( 2.0 * pMonster:GetSpeedY() / 3.0 )
    
    if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false ) then
		if( pMonster:FloatRand() < 0.1) then    
			pMonster:AddCountValue(1)		
			if( pMonster:FloatRand() < 0.5 ) then
				pMonster:SetState( "ATTACK03" )
			else
				pMonster:SetState( "JUMP" )
			end		
		end
	end
end