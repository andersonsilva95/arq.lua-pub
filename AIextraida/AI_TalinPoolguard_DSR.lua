-- AI_Talin_Pollguard_Man.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Talin_Pollguard_Man_Wait.frm",
        Func    = "Talin_Pollguard_Man_WaitFunc",
    },

    -- �̵�
    {
        ID              = "WALK",
        Motion          = "Talin_Pollguard_Man_move.frm",
        Func            = "Talin_Pollguard_Man_moveFunc",
    },
        
    -- ��������
    {
        ID      = "ATTACK01",
        Motion  = "Talin_Pollguard_Man_Attack01.frm",
        Func    = "Talin_Pollguard_Man_Attack01Func",
    },
    
    -- ��������2
    {
        ID      = "ATTACK02",
        Motion  = "Talin_Pollguard_Man_Attack02.frm",
        Func    = "Talin_Pollguard_Man_Attack02Func",
    },
    
    -- ��������3
    {
        ID      = "ATTACK03",
        Motion  = "Talin_Pollguard_Man_Attack03.frm",
        Func    = "Talin_Pollguard_Man_Attack03Func",
    },
    
    -- ��������
    {
        ID      = "ATTACK04",
        Motion  = "Talin_Pollguard_Man_Attack04.frm",
        Func    = "Talin_Pollguard_Man_Attack04Func",
    },
    
    -- ��������2
    {
        ID      = "ATTACK05",
        Motion  = "Talin_Pollguard_Man_Attack05.frm",
        Func    = "Talin_Pollguard_Man_Attack05Func",
    },
    
    -- ��������3
    {
        ID      = "ATTACK06",
        Motion  = "Talin_Pollguard_Man_Attack06_front.frm",
        Func    = "Talin_Pollguard_Man_Attack06Func",
    },
    
    -- ��������3
    {
        ID      = "ATTACK06_2",
        Motion  = "Talin_Pollguard_Man_Attack06_back.frm",
        Func    = "Talin_Pollguard_Man_Attack06_2Func",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Talin_Pollguard_Man_Damage_Middle.frm",
        Func    = "Talin_Pollguard_Man_DamageFunc",
    },

    -- �ױ� ����
    {
        ID      = "DIE_LANDING",
        Motion  = "Talin_Pollguard_Man_Die.frm",
        Func    = "Talin_Pollguard_Man_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
     -- �ױ� ����
    {
        ID      = "DIE_LOOP",
        Motion  = "Talin_Pollguard_Man_die_action.frm",
        Func    = "Talin_Pollguard_Man_DieLoopFunc",
    },
    
    -- turn
	{
		ID	  = "TURN",
		Motion  = "Talin_Pollguard_Man_move_turn.frm",
		Func	= "Talin_Pollguard_Man_TurnFunc",
	},
}

CallBack =
{
    Land    = "OnTalin_Pollguard_Man_Land",
    Die     = "OnTalin_Pollguard_Man_Die",
    Damage  = "OnTalin_Pollguard_Man_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitTalin_Pollguard_Man( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetPushCheck( false )
	pMonster:SetIgnoreFHCheck( true )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Talin_Pollguard_Man_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetTraceIndex(0,35)
	--pMonster:SetTraceGap( -0.17, 0.0 )
	pMonster:SetTraceGap( 0.0, 0.0 )
	pMonster:SetTrace(true)
	pMonster:SetFly(true)
	pMonster:SetTracePercent(1.0)
	pMonster.DefRatio = 100000000.0

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ȱ� ����
function Talin_Pollguard_Man_moveFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- �ױ� ����
function Talin_Pollguard_Man_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster(true)
        pMonster:SetState( "DIE_LOOP" )
    end
end

-- �ױ� ����
function Talin_Pollguard_Man_DieLoopFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DIE_LOOP" )
    end
end

-- ������ ������
function Talin_Pollguard_Man_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

function Talin_Pollguard_Man_TurnFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
	    pMonster:SetIsRight( not pMonster:GetIsRight() )
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function Talin_Pollguard_Man_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  ��������2 ����
function Talin_Pollguard_Man_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  
function Talin_Pollguard_Man_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		--pMonster:SetSuperArmor( true )
	elseif( iFrame == 36 ) then
		if ( pMonster:SetTarget( 0, -3000, 2000, 3000, -2000 ) ) then
			pMonster:ComputeAngleToTarget( 0.0, 0.0 ) -- Ÿ�������� ������ ���
			angle = pMonster:GetAngleToTarget()
			if( not pMonster:GetIsRight() ) then
				angle = angle * -1.0
			end
			
			if ( ( pMonster:GetX() > pMonster:GetTargetX() and pMonster:GetIsRight() ) or
			     ( pMonster:GetX() < pMonster:GetTargetX() and not pMonster:GetIsRight() ) ) then
				angle = angle * -1.0 + 3.1415
			end
			
			pMonster:AddDamageWithLocateAngle( DT_TALIN_DSR_THROW_ATK, 0.0, 0.0, false, angle )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

function Talin_Pollguard_Man_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

function Talin_Pollguard_Man_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

function Talin_Pollguard_Man_Attack06Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

function Talin_Pollguard_Man_Attack06_2Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ���� ����
function Talin_Pollguard_Man_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame > 20 and pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMP_DOWN")
		pMonster:SetFrameLock( false )
	end
	
	if( iFrame == 15 ) then
		Talin_Pollguard_Man_Jump( iMonsterIndex )
	end
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ���� �ٿ� ����
function Talin_Pollguard_Man_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ���� ����
function Talin_Pollguard_Man_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ����Ŀ�� �ɷ���
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

--  ���̽�Ŀ�� �ɷ���
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


-- Ȧ�� �ɷ���(����Ʈ)
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
-- �����üũ
-----------------------------------------------------------------------

function Talin_Pollguard_Man_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 200, -500, 320, 500, -100 ) == true or pMonster:SetTarget( 100, -300, 500, 300, -300 ) == true ) then
		pMonster:TurnToTarget()
		
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

function Talin_Pollguard_Man_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 600, -500, 500, 500, -300 ) == true and pMonster:FloatRand() < 0.7) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
	end
end

function Talin_Pollguard_Man_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 150, -160, 100, 160, -140 ) == true ) then
	
		if ( pMonster:FloatRand() < 0.8) then				
			pMonster:SetSpeedX( 0.0 )
			pMonster:SetState( "WAIT" )
		end
		
		pMonster:ResetDelay()
	end
end

function Talin_Pollguard_Man_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function Talin_Pollguard_Man_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 330, 200, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function Talin_Pollguard_Man_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 330, 200, -100 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function Talin_Pollguard_Man_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 330, 200, -100 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function Talin_Pollguard_Man_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 330, 200, -100 ) == true ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
	end
end

function Talin_Pollguard_Man_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 330, 200, -100 ) == true ) then
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
	end
end

function Talin_Pollguard_Man_Check_Attack06( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 330, 200, -100 ) == true ) then
		pMonster:SetState( "ATTACK06" )
		pMonster:ResetDelay()
	end
end

function Talin_Pollguard_Man_Check_Attack06_2( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 330, 200, -100 ) == true ) then
		pMonster:SetState( "ATTACK06_2" )
		pMonster:ResetDelay()
	end
end

function Talin_Pollguard_Man_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 120, -130, 100, 130, -140 ) == true ) then
		if ( pMonster:FloatRand() < 0.6 ) then
			pMonster:SetSpeedX( 0.0 )
			pMonster:SetState( "WAIT" )
		end
		pMonster:ResetDelay()
	end
end
-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnTalin_Pollguard_Man_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
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
	
    pMonster:SetPushCheck( false )
end

function Talin_Pollguard_Man_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	if ( (fTargetY - fMonY) == 0.0 ) then
		fTargetY = fMonY + 0.1
	end
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 4.9))
	pMonster:AddCountValue(1)
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