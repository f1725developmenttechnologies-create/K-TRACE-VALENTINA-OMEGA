from pydantic import BaseModel, Field, validator
from typing import List, Optional, Dict
from datetime import datetime
import uuid

class EvidenceTopology(BaseModel):
    """Modelo de datos para la topología de 11 dimensiones"""
    dimensions: int = Field(default=11, ge=1)
    cliques: List[List[int]] # Representación de grafos para el Blue Brain Project
    cavities: int
    euler_characteristic: float

class ForensicTrace(BaseModel):
    """Cerebro 7: Representación de trazas de materiales (Grafeno/MXenes)"""
    material_type: str = Field(..., pattern="^(Graphene|MXene|Hybrid_Ti3C2Tx)$")
    plasma_energy_kev: float
    stoichiometry: Dict[str, float]
    purity_index: float = Field(..., le=1.0, ge=0.0)

class ValentinaMemoryRecord(BaseModel):
    """El registro final que se guarda en CockroachDB"""
    record_id: uuid.UUID = Field(default_factory=uuid.uuid4)
    case_id: str
    timestamp: datetime = Field(default_factory=datetime.utcnow)
    trace_data: ForensicTrace
    topology: EvidenceTopology
    integrity_hash: str # Cadena de custodia
    status: str = "IMMUTABLE"

    class Config:
        from_attributes = True
